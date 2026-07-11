# Offline Mode Migration Plan

> Living document — update as decisions are made and phases complete.
> Last updated: 2026-07-11

---

## 1. Goals & Non-Goals

### Goals (v1)

- [ ] **Read offline** — core screens show last-synced data when there is no network
- [ ] **Write queue** — create/update/delete operations are queued locally and flushed on reconnect
- [ ] **Transparent repo layer** — providers call repositories; repositories choose local vs remote
- [ ] **Filter parity (partial)** — existing filter providers keep working; offline supports a documented subset
- [ ] **Stale-data UX** — user can tell when data is cached and when last sync happened

### Non-Goals (v1)

- Real-time multi-device sync or conflict UI
- Full offline dashboard aggregates (cache last response only)
- Offline audit log browsing beyond cached pages
- Offline auth for new users (login still requires network)
- Migrating every entity in one release

### Open decisions

| # | Question | Options | Decision |
|---|----------|---------|----------|
| D1 | Offline write scope | Read-only first vs queued writes from day one | _TBD_ |
| D2 | Conflict resolution | Server-wins / local-wins / last-write-wins | _TBD_ — recommend **server-wins** for v1 |
| D3 | Auth grace period | Block app when token expired offline vs allow read-only | _TBD_ |
| D4 | Bulk ops offline (suspend customers) | Queue / online-only | _TBD_ — recommend **online-only** for v1 |
| D5 | paymentFilter offline | Denormalize columns / online-only | _TBD_ — recommend **online-only** for v1 |

---

## 2. Current Architecture (Baseline)

```
UI (ConsumerWidget)
  → Riverpod AsyncNotifier          lib/data/providers/
    → Service                       lib/core/network/services/
      → ApiExecutor → DioClient     lib/core/network/client/
        → REST API
          → Response DTO → Mapper → Domain Entity
```

**What exists today:**

| Piece | Status |
|-------|--------|
| Domain entities + DTO mappers | ✅ |
| Riverpod list/filter/pagination providers | ✅ |
| Drift schema (`infrastructor/`) | ⚠️ Scaffolded, not wired |
| Repository layer | ❌ |
| Local data sources / DAOs | ❌ |
| Sync engine / outbox | ❌ |
| Connectivity gating reads | ❌ — snackbar only via `internetConnectionProvider` |

**Target architecture:**

```
UI + Filter Providers (unchanged contract)
  → Riverpod Notifiers
    → Repository (domain interface)
      ├── RemoteDataSource  (wraps existing *Service)
      ├── LocalDataSource   (Drift DAOs)
      └── SyncCoordinator   (snapshot upsert + outbox flush)
```

---

## 3. Entity Sync Matrix

| Entity | Provider(s) | Drift table | Schema complete? | Tier | Offline read | Offline write | Snapshot trigger |
|--------|-------------|-------------|-------------------|------|--------------|---------------|------------------|
| **Area** | `areaProvider` | ❌ missing | — | 1 Reference | ✅ target | ❌ v1 | Login + reconnect |
| **DistributionBox** | `distributionBoxProvider` | ❌ missing | — | 1 Reference | ✅ target | ❌ v1 | Login + reconnect |
| **AmpereSchedule** | `ampereScheduleProvider` | ❌ missing | — | 1 Reference | ✅ target | ❌ v1 | Login + reconnect |
| **Company / preferences** | `companyProvider` | `CompanyPreferencesTable` | ⚠️ partial | 1 Reference | ✅ target | ❌ v1 | Login |
| **Customer** | `customerProvider`, `singleCustomerProvider` | `Customers` | ⚠️ partial | 2 Core | ✅ target | ✅ target | Cache-on-fetch + reconnect |
| **Invoice** | `invoiceProvider`, `singleInvoiceProvider` | `Invoices` | ⚠️ partial | 2 Core | ✅ target | ✅ target | Cache-on-fetch |
| **Payment** | via invoice service | `Payments` | ⚠️ partial | 2 Core | ✅ target | ⚠️ via invoice pay | With invoice sync |
| **Expense** | `expenseProvider`, `singleExpenseProvider` | `ExpensesTable` | ❌ **mismatch** | 2 Core | ✅ target | ✅ target | Cache-on-fetch |
| **OtherExpenses** | nested in expense | `OtherExpensesTable` | ⚠️ legacy? | — | Review | — | May deprecate |
| **MeterReading** | `meterReadingProvider` | ❌ missing | — | 2 Core | ✅ target | ✅ target | With customer detail |
| **AuditLog** | `auditLogProvider` | ❌ missing | — | 3 Optional | ⚠️ cached pages | ❌ | Cache-on-fetch only |
| **Dashboard** | `dashboardProvider` | ❌ | — | 3 Optional | ⚠️ last snapshot | ❌ | Last successful API response |

**Tier legend:**

- **Tier 1 — Reference:** small, rarely changes, needed for forms/dropdowns
- **Tier 2 — Core transactional:** main business data, paginated lists
- **Tier 3 — Derived / heavy:** aggregates or append-only logs

---

## 4. Drift Schema Plan

### 4.1 Conventions

- Drift row classes use `@DataClassName('XxxRow')` — **never** collide with domain entity names (fix existing `Customer`, `Invoice`, `Expenses` collisions)
- Every cached table gets sync metadata columns (see §4.3)
- Enums stored as `TEXT` matching API string values (same as JSON serialization)
- Denormalized display fields allowed (`areaName`, `boxName`, `customerName`) for offline list rendering without joins to uncached tables
- Migrations: bump `schemaVersion`, implement `onUpgrade` — never rely on `onCreate` only after v1 ships

### 4.2 Existing tables — gaps vs domain

#### `Customers` → domain `Customer`

| Domain field | Drift today | Action |
|--------------|-------------|--------|
| id, createdAt, updatedAt, companyId, name, phone, address | ✅ | keep |
| customerType, subscriptionDate, customerStatus, plan, planValue | ✅ (as `plan`) | keep |
| building, floor, cableName | ❌ | **add** |
| boxId, boxName, areaId, areaName | ❌ | **add** + index |
| ampereScheduleId, ampereScheduleName | ❌ | **add** |
| customerRelation | ❌ | **add** |
| priceOverride, fixedChargeOverride, tvaOverride, hasPricingOverride | ❌ | **add** |
| totalBilled, totalPaid, totalOutstanding | ❌ | **add** (denormalized for lists) |
| paymentFilter helpers | ❌ | **add** if D5 chooses denormalize: `hasUnpaidInvoice`, `lastPaymentDate` |
| invoices (nested) | ❌ | separate `Invoices` table, not embedded |

#### `Invoices` → domain `Invoice`

| Domain field | Drift today | Action |
|--------------|-------------|--------|
| id, createdAt, updatedAt, companyId, customerId, dates, amounts, invoiceStatus | ✅ mostly | keep |
| invoiceNumber | ❌ | **add** |
| customerName | ❌ | **add** (denormalized) |
| billedConsumption | ❌ | **add** |
| payments (nested) | ❌ | separate `Payments` table |

#### `ExpensesTable` → domain `Expense`

| Domain field | Drift today | Action |
|--------------|-------------|--------|
| id, createdAt, updatedAt, expenseDate, notes | ✅ | keep |
| expenseType, amount, label | ❌ | **add** — current table has legacy `fuelExpense` / `maintenanceExpenses` / `employeesExpenses` columns that **do not match** domain model; **replace schema** |

#### New tables required

| Table | Key columns | FK |
|-------|-------------|-----|
| `Areas` | id, companyId, name, customerCount, sync cols | → AppUsers |
| `DistributionBoxes` | id, name, areaId, areaName, locationNote, notes, customerCount, sync cols | → Areas |
| `AmpereSchedules` | id, name, hoursPerDay, pricePerAmp, customerCount, sync cols | — |
| `MeterReadings` | id, customerId, readingValue, consumption, createdAt, sync cols | → Customers |
| `AuditLogs` | id, action, status, summary, entityType, entityId, detailsJson, userEmail, createdAt, sync cols | — |
| `DashboardSnapshots` | id, fetchedAt, summaryJson | — |
| `Outbox` | id, entityType, operation, payloadJson, createdAt, retryCount, lastError | — |
| `SyncState` | entityType, lastSyncedAt, cursor/page | — |

### 4.3 Sync metadata columns (all cached entity tables)

```dart
// Add to every entity table
DateTimeColumn get remoteUpdatedAt => dateTime().nullable()();
DateTimeColumn get syncedAt => dateTime().nullable()();
BoolColumn get isDirty => boolean().withDefault(const Constant(false))();
DateTimeColumn get deletedAt => dateTime().nullable()(); // tombstone for server deletes
```

### 4.4 Outbox table

| Column | Purpose |
|--------|---------|
| `id` | Local UUID |
| `entityType` | e.g. `customer`, `invoice` |
| `entityId` | Remote ID if known, local temp ID otherwise |
| `operation` | `create` / `update` / `delete` |
| `payloadJson` | Serialized request DTO |
| `createdAt` | Queue time |
| `retryCount` | Flush retries |
| `lastError` | Last failure message |

---

## 5. Repository Layer

### 5.1 File layout (proposed)

```
lib/
  domain/
    repositories/
      customer_repository.dart      # abstract interface
      invoice_repository.dart
      ...
  data/
    repositories/
      customer_repository_impl.dart
    sources/
      remote/
        customer_remote_source.dart   # wraps CustomerService
      local/
        customer_local_source.dart    # Drift DAO queries
    sync/
      sync_coordinator.dart
      outbox_processor.dart
```

### 5.2 Repository contract example

```dart
abstract class CustomerRepository {
  Future<PagedResult<Customer>> getCustomers(CustomerFilterRequest filter);
  Future<Customer?> getById(String id);
  Future<void> create(CreateCustomerRequest request);
  Future<void> update(String id, UpdateCustomerRequest request);
  Future<void> delete(String id);
  Future<SuspendCustomersResponse> suspend(SuspendCustomersRequest request);
}
```

`PagedResult<T>` replaces raw `List<T>` + separate pagination provider updates inside the repo impl (notifier still updates pagination provider from the result).

### 5.3 Read path

**Online:**

1. Call remote source with filter
2. Upsert response rows into Drift (snapshot)
3. Update `SyncState` for entity
4. Return `PagedResult` to provider

**Offline:**

1. Translate `CustomerFilterRequest` → Drift query (see §6)
2. `COUNT(*)` for pagination meta
3. Return `PagedResult` with `isFromCache: true`

### 5.4 Write path

**Online:** remote call → upsert local → return

**Offline:**

1. Apply optimistic update to local DB (`isDirty = true`)
2. Insert outbox row
3. Provider refreshes from local
4. On reconnect: `OutboxProcessor` flushes FIFO, server response replaces local row, clears `isDirty`

### 5.5 Provider wiring change

Minimal diff per list provider:

```dart
// Before
CustomerService get _service => ref.read(customerServiceProvider);

// After
CustomerRepository get _repo => ref.read(customerRepositoryProvider);
```

Filter providers, pagination providers, and UI filter screens **stay unchanged**.

---

## 6. Snapshot Policy

### 6.1 Triggers

| Trigger | Action |
|---------|--------|
| **Login success (online)** | Bootstrap Tier 1: areas, boxes, ampere schedules, company preferences |
| **App resume (online)** | If last sync > N minutes, refresh Tier 1 |
| **Connectivity restored** | Flush outbox → refresh active list filters → bootstrap Tier 1 |
| **Successful API list fetch** | Upsert returned page into local DB (cache-as-you-go) |
| **Successful API detail fetch** | Upsert single entity + related rows (e.g. customer + meter readings) |
| **Manual pull-to-refresh** | Force remote fetch + upsert (same as online read path) |

### 6.2 What is NOT a full snapshot

Do **not** attempt to download the entire server database on login. Paginated cache-as-you-go matches current UX and scales better.

Optional warm sync: prefetch page 1 of customers/invoices with default filter on login.

### 6.3 Stale data UX

- Global or per-screen banner when `internetConnectionProvider == false`
- Show `lastSyncedAt` from `SyncState` on list screens
- Detail screens: indicate if entity has pending outbox writes (`isDirty`)

---

## 7. Filter Strategy

**Principle:** keep existing `*FilterRequest` DTOs as the query contract. Repository translates to API params (online) or Drift queries (offline).

Implement per entity: `lib/data/sources/local/queries/customer_filter_query.dart`

Legend: ✅ supported offline · ⚠️ degraded · ❌ online-only

### 7.1 Customer (`CustomerFilterRequest`)

| Field | Online | Offline v1 | Drift approach |
|-------|--------|------------|----------------|
| `name` | API | ✅ | `WHERE name LIKE '%?%'` |
| `phone` | API | ✅ | `WHERE phone LIKE '%?%'` |
| `areaId` | API | ✅ | `WHERE areaId = ?` (needs column) |
| `boxId` | API | ✅ | `WHERE boxId = ?` (needs column) |
| `planType` | API | ✅ | `WHERE plan = ?` |
| `customerRelation` | API | ✅ | `WHERE customerRelation = ?` |
| `customerStatus` | API | ✅ | `WHERE customerStatus = ?` |
| `paymentFilter` | API | ❌ | Requires denormalized columns — defer (D5) |
| `pageNumber` / `pageSize` | API meta | ✅ | `LIMIT/OFFSET` + local `COUNT(*)` |

**UI when offline + paymentFilter active:** clear filter or show "requires connection" chip.

### 7.2 Invoice (`InvoiceFilterRequest`)

| Field | Online | Offline v1 | Drift approach |
|-------|--------|------------|----------------|
| `customerId` | API | ✅ | `WHERE customerId = ?` |
| `invoiceStatus` | API | ✅ | `WHERE invoiceStatus = ?` |
| `issueDateFrom` | API | ✅ | `WHERE issueDate >= ?` |
| `issueDateTo` | API | ✅ | `WHERE issueDate <= ?` |
| pagination | API meta | ✅ | local COUNT + LIMIT/OFFSET |

### 7.3 Expense (`ExpenseFilterRequest`)

| Field | Online | Offline v1 | Drift approach |
|-------|--------|------------|----------------|
| `dateFrom` | API | ✅ | `WHERE expenseDate >= ?` |
| `dateTo` | API | ✅ | `WHERE expenseDate <= ?` |
| `expenseType` | API | ✅ | `WHERE expenseType = ?` |
| pagination | API meta | ✅ | local COUNT + LIMIT/OFFSET |

### 7.4 DistributionBox (`DistributionBoxFilterRequest`)

| Field | Online | Offline v1 | Drift approach |
|-------|--------|------------|----------------|
| `areaId` | API | ✅ | `WHERE areaId = ?` |
| `name` | API | ✅ | `WHERE name LIKE '%?%'` |
| pagination | API meta | ✅ | local COUNT + LIMIT/OFFSET |

### 7.5 AuditLog (`AuditLogFilterRequest`)

| Field | Online | Offline v1 | Drift approach |
|-------|--------|------------|----------------|
| `action` | API | ⚠️ | Only on cached pages |
| `status` | API | ⚠️ | Only on cached pages |
| `createdFrom` / `createdTo` | API | ⚠️ | Drift query on cached rows |
| pagination | API infinite scroll | ⚠️ | Return cached pages; no fetch beyond cache offline |

**Note:** `auditLogProvider` uses append/load-more — offline returns what is cached; no new pages.

### 7.6 Non-paginated lists

| Provider | Offline v1 |
|----------|------------|
| `areaProvider` | ✅ full local table |
| `ampereScheduleProvider` | ✅ full local table |
| `meterReadingProvider` | ✅ by customerId from local |

### 7.7 Client-side search today

| Screen | Current behavior | Offline v1 |
|--------|------------------|------------|
| `area_selecting_screen` | Client filter on loaded list | ✅ works if areas cached |
| `box_selecting_screen` | Debounced server search | ✅ local LIKE on cached boxes |
| `subscribers_search_screen` | Server via filter provider | ✅ via repo offline branch |

---

## 8. Sync & Conflict Rules

### 8.1 v1 defaults (recommended)

| Scenario | Rule |
|----------|------|
| Server delete while offline | On sync, apply tombstone (`deletedAt`) locally |
| Local edit + server edit same entity | **Server wins** — overwrite local, notify user if `isDirty` was true |
| Local create offline | Temp local ID → replace with server ID on flush |
| Flush failure | Keep in outbox, increment `retryCount`, surface error after N retries |
| Partial page cache | Acceptable — offline shows "partial data" if `totalCount` > cached count |

### 8.2 Connectivity source

Use existing `internetConnectionProvider` / `InternetConnectionHelper` — repository reads connectivity via injected `Ref` or dedicated `ConnectivityService`.

---

## 9. Migration Phases

### Phase 0 — Planning & decisions ✅ (this doc)

- [x] Document baseline architecture
- [ ] Resolve open decisions D1–D5
- [ ] Review with team / self

**Acceptance:** all open decisions have a row in §1 filled in.

---

### Phase 1 — Drift infrastructure

- [ ] Wire `AppDatabase` via `@Riverpod` provider
- [ ] Rename Drift data classes (`CustomerRow`, etc.)
- [ ] Align schema with domain (§4.2) — schema version 2
- [ ] Implement `onUpgrade` migration from v1
- [ ] Add sync metadata columns + `Outbox` + `SyncState` tables
- [ ] Row mappers: `CustomerRow ↔ Customer` (separate from DTO mappers)

**Acceptance:** app opens DB, migrations run, unit test inserts/reads one row.

---

### Phase 2 — First vertical slice: Reference data

**Entities:** Area, DistributionBox, AmpereSchedule

- [ ] Add Drift tables + DAOs
- [ ] `AreaRepository`, `DistributionBoxRepository`, `AmpereScheduleRepository`
- [ ] Bootstrap sync on login / reconnect
- [ ] Swap `areaProvider`, `distributionBoxProvider`, `ampereScheduleProvider` to repos
- [ ] Offline: selecting screens work from cache

**Acceptance:** enable airplane mode → area/box pickers still populate from cache.

---

### Phase 3 — Customers (core read path)

- [ ] Complete `Customers` schema
- [ ] `CustomerRepository` read methods + filter query translator
- [ ] Cache-on-fetch on online reads
- [ ] Swap `customerProvider`, `singleCustomerProvider`
- [ ] Stale banner + last synced timestamp on subscribers list

**Acceptance:** browse/filter customers offline with cached data; pagination works locally.

---

### Phase 4 — Customer writes + outbox

- [ ] Outbox processor on reconnect
- [ ] Optimistic local create/update/delete
- [ ] Swap mutation methods on `CustomerNotifier`
- [ ] Handle temp IDs on create

**Acceptance:** create customer offline → reconnect → appears on server; list consistent.

---

### Phase 5 — Invoices & payments

- [ ] Complete `Invoices` / `Payments` schema
- [ ] Invoice repository + filter translator
- [ ] Pay invoice: online or queued per D1

**Acceptance:** invoice list/filter offline; pay queues or blocks gracefully.

---

### Phase 6 — Expenses & meter readings

- [ ] Replace legacy expense Drift schema
- [ ] Expense + meter reading repos
- [ ] Customer detail meter readings from local

**Acceptance:** expense CRUD offline; meter readings visible on cached customer.

---

### Phase 7 — Polish & optional

- [ ] Dashboard last-snapshot cache
- [ ] Audit log cached-page offline browsing
- [ ] Background sync on connectivity stream
- [ ] Integration tests for offline flows

---

## 10. Index Plan (Drift)

Add indexes for filter columns:

```sql
-- Customers
CREATE INDEX idx_customers_area ON customers(area_id);
CREATE INDEX idx_customers_box ON customers(box_id);
CREATE INDEX idx_customers_name ON customers(name);
CREATE INDEX idx_customers_status ON customers(customer_status);

-- Invoices
CREATE INDEX idx_invoices_customer ON invoices(customer_id);
CREATE INDEX idx_invoices_issue_date ON invoices(issue_date);
CREATE INDEX idx_invoices_status ON invoices(invoice_status);

-- DistributionBoxes
CREATE INDEX idx_boxes_area ON distribution_boxes(area_id);
CREATE INDEX idx_boxes_name ON distribution_boxes(name);

-- Outbox
CREATE INDEX idx_outbox_created ON outbox(created_at);
```

---

## 11. Risks & Mitigations

| Risk | Impact | Mitigation |
|------|--------|------------|
| Drift/domain name collision | Build errors, confusion | Rename all `@DataClassName` now (Phase 1) |
| Expense schema mismatch | Wrong offline data | Replace table in migration, don't patch legacy columns |
| paymentFilter complexity | Blocks customer offline parity | Mark online-only in v1 (D5) |
| Pagination totalCount offline | Misleading page counts | Use local COUNT; show "cached results" when offline |
| Large outbox on long offline | Sync storm on reconnect | Batch flush with backoff; cap retries |
| Token expiry offline | User locked out | Read-only grace or cached session policy (D3) |
| Provider refactor scope | Regression | One vertical slice at a time; keep service layer until repo proven |

---

## 12. Testing Checklist

### Per phase

- [ ] Unit: filter DTO → Drift query produces expected SQL
- [ ] Unit: row mapper round-trip domain ↔ Drift
- [ ] Unit: outbox serialize/deserialize request DTOs
- [ ] Widget: offline banner visible when disconnected
- [ ] Integration: online fetch → airplane mode → list still renders
- [ ] Integration: offline create → online → data on server

### Manual QA screens

- [ ] Subscribers list + filters + search
- [ ] Subscriber add/edit
- [ ] Invoices list + filters
- [ ] Expenses list
- [ ] Area/box/schedule pickers in add subscriber flow
- [ ] Dashboard (degraded expectations documented)

---

## 13. Key File References

| Area | Path |
|------|------|
| Drift DB | `lib/infrastructor/db/database.dart` |
| Drift tables | `lib/infrastructor/tables/` |
| List providers | `lib/data/providers/` |
| Filter providers | `lib/data/providers/*/*_filter_provider.dart` |
| Filter DTOs | `lib/core/network/dto/request/*/*_filter_request.dart` |
| Services | `lib/core/network/services/` |
| Domain entities | `lib/domain/entities/` |
| Connectivity | `lib/data/providers/network/internet_connection_provider.dart` |

---

## 14. Changelog

| Date | Author | Change |
|------|--------|--------|
| 2026-07-11 | — | Initial plan from codebase audit |

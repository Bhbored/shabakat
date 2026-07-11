# Offline Mode Migration Plan

> **Scope:** Read-only offline using the Drift tables already in `lib/infrastructor/`.
> Last updated: 2026-07-11

---

## 1. What you decided

| Topic | Choice |
|-------|--------|
| Offline mode | **Read-only** — browse cached data; all writes need network |
| Cache strategy | **Snapshot-on-fetch** — upsert to Drift after successful API reads |
| Writes offline | Block in UI + keep calling `*Service` only when online |
| Filter DTOs | **Unchanged** — repo translates same `*FilterRequest` to Drift when offline |

---

## 2. What is in the database today

Registered in `AppDatabase` (`schemaVersion: 1`):

| Drift table | File | Maps to domain |
|-------------|------|----------------|
| `Areas` | `area_table.dart` | `Area` |
| `DistributionBoxes` | `distribution_box_table.dart` | `DistributionBox` |
| `Customers` | `customer_table.dart` | `Customer` (no nested `invoices`) |
| `Invoices` | `invoice_table.dart` | `Invoice` (no nested `payments`) |
| `Payments` | `payment_table.dart` | `Payment` |
| `ExpensesTable` | `expenses_table.dart` | `Expense` |
| `MeterReadings` | `meter_reading_table.dart` | `MeterReading` + `customerId` for local queries |

**Not cached (no table — online only in v1):**

- `AmpereSchedule`, `AuditLog`, `Company`, `CompanyPreferences`, `Dashboard`

---

## 3. Table reference (as built)

### `Areas`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `createdAt`, `updatedAt` | DateTime | |
| `name` | text | `idx_area_name` |
| `customerCount` | int, default 0 | |

> Domain also has `companyId` — not on table; OK for read-only cache if single-tenant.

---

### `DistributionBoxes`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `name` | text | |
| `areaId` | text → `Areas.id` | `idx_distribution_box_area_id` |
| `areaName` | text | |
| `locationNote`, `notes` | text? | |
| `customerCount` | int, default 0 | |
| `createdAt` | DateTime | |

---

### `Customers`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `createdAt`, `updatedAt` | DateTime | |
| `name` | text | `idx_customer_name` |
| `totalBilled`, `totalPaid`, `totalOutstanding` | real? | |
| `phone` | text? | `idx_customer_phone` |
| `address`, `building`, `floor`, `cableName` | text? | |
| `boxId` | text? → `DistributionBoxes.id` | `idx_customer_box_id` |
| `boxName` | text? | |
| `ampereScheduleId`, `ampereScheduleName` | text? | |
| `areaName` | text? | |
| `areaId` | text? → `Areas.id` | `idx_customer_area_id` |
| `customerType` | text | |
| `customerRelation` | text? | `idx_customer_customer_relation` |
| `subscriptionDate` | DateTime | |
| `priceOverride`, `fixedChargeOverride`, `tvaOverride` | real? | |
| `hasPricingOverride` | bool, default false | |
| `customerStatus` | text, default `'active'` | `idx_customer_customer_status` |
| `plan` | text | `idx_customer_plan` |
| `planValue` | real | |

**Filter note:** `CustomerFilterRequest.paymentFilter` has **no column** — treat as **online-only** or filter via `totalOutstanding` heuristics later.

---

### `Invoices`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `createdAt`, `updatedAt` | DateTime | |
| `customerId` | text → `Customers.id` | `idx_invoice_customer_id` |
| `customerName` | text? | |
| `invoiceNumber` | int | |
| `issueDate` | DateTime | `idx_invoice_issue_date` |
| `dueDate` | DateTime | `idx_invoice_due_date` |
| `fixedCharge`, `tva`, `totalAmount`, `paidAmount`, `amountDue` | real | |
| `billedConsumption` | real? | |
| `invoiceStatus` | text, default `'unpaid'` | `idx_invoice_invoice_status` |

---

### `Payments`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `createdAt`, `updatedAt` | DateTime | |
| `customerId` | text → `Customers.id` | `idx_payment_customer_id` |
| `invoiceId` | text → `Invoices.id` | `idx_payment_invoice_id` |
| `amount` | real | |
| `paymentMethod` | text | |
| `paymentDate` | DateTime | `idx_payment_payment_date` |
| `notes` | text? | |

> Domain has `companyId` — not on table.

---

### `ExpensesTable`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `createdAt`, `updatedAt` | DateTime | |
| `expenseType` | text | `idx_expense_expense_type` |
| `expenseDate` | DateTime | `idx_expense_expense_date` |
| `amount` | real | |
| `label`, `notes` | text? | |

---

### `MeterReadings`

| Column | Type | Index |
|--------|------|-------|
| `id` | PK | |
| `customerId` | text → `Customers.id` | `idx_meter_reading_customer_id` |
| `readingValue` | real | |
| `consumption` | real? | |
| `createdAt` | DateTime | `idx_meter_reading_created_at` |

> `customerId` is for local storage; domain `MeterReading` omits it — set in row mapper from provider arg.

---

## 4. FK order (create / upsert)

```
Areas
  └── DistributionBoxes
        └── Customers
              ├── Invoices
              │     └── Payments
              └── MeterReadings
ExpensesTable  (standalone)
```

Upsert reference data before customers: **Areas → DistributionBoxes → Customers**.

---

## 5. Provider → table coverage

| Provider | Offline read from | Online-only when no cache |
|----------|-------------------|---------------------------|
| `areaProvider` | `Areas` | empty state |
| `distributionBoxProvider` | `DistributionBoxes` | empty state |
| `customerProvider` / `singleCustomerProvider` | `Customers` | empty state |
| `invoiceProvider` / `singleInvoiceProvider` | `Invoices` (+ optional join `Payments`) | empty state |
| `expenseProvider` / `singleExpenseProvider` | `ExpensesTable` | empty state |
| `meterReadingProvider` | `MeterReadings` WHERE `customerId` | empty state |
| `ampereScheduleProvider` | — | always needs network |
| `auditLogProvider` | — | always needs network |
| `dashboardProvider` | — | always needs network |
| `companyProvider` / `companyProfileProvider` | — | always needs network |

---

## 6. Architecture (minimal)

```
List/detail provider
  → Repository.getX(filter)
       if online  → Service → DTO → Entity → upsert Drift → return
       if offline → Drift DAO → row mapper → Entity → return (isFromCache: true)

Mutation on notifier
  → if offline: show message, return
  → if online:  Service → refresh() (which re-caches via repo read path)
```

**Still TODO (not in schema yet):**

- Wire `AppDatabase` Riverpod provider
- DAOs / local sources per table above
- Row mappers (`Customer` drift row ↔ domain `Customer`) — rename `@DataClassName` to `*Row` to avoid collisions
- `CacheCoordinator.upsertAll()` after each online fetch

**Skip for v1:** `Outbox`, `SyncState`, `isDirty`, cache metadata columns — add only if you need `lastSyncedAt` UI later.

---

## 7. Offline filters (only for tables you have)

### Customer → `Customers`

| Filter field | Offline | Drift |
|--------------|---------|-------|
| `name` | ✅ | `LIKE` on `name` |
| `phone` | ✅ | `LIKE` on `phone` |
| `areaId` | ✅ | `areaId = ?` |
| `boxId` | ✅ | `boxId = ?` |
| `planType` | ✅ | `plan = ?` |
| `customerRelation` | ✅ | `customerRelation = ?` |
| `customerStatus` | ✅ | `customerStatus = ?` |
| `paymentFilter` | ❌ | no column — online-only |
| pagination | ✅ | `COUNT` + `LIMIT/OFFSET` |

### Invoice → `Invoices`

| Filter field | Offline | Drift |
|--------------|---------|-------|
| `customerId` | ✅ | `customerId = ?` |
| `invoiceStatus` | ✅ | `invoiceStatus = ?` |
| `issueDateFrom` / `issueDateTo` | ✅ | range on `issueDate` |
| pagination | ✅ | `COUNT` + `LIMIT/OFFSET` |

### Expense → `ExpensesTable`

| Filter field | Offline | Drift |
|--------------|---------|-------|
| `dateFrom` / `dateTo` | ✅ | range on `expenseDate` |
| `expenseType` | ✅ | `expenseType = ?` |
| pagination | ✅ | `COUNT` + `LIMIT/OFFSET` |

### DistributionBox → `DistributionBoxes`

| Filter field | Offline | Drift |
|--------------|---------|-------|
| `areaId` | ✅ | `areaId = ?` |
| `name` | ✅ | `LIKE` on `name` |
| pagination | ✅ | `COUNT` + `LIMIT/OFFSET` |

### Area / MeterReading

- **Area:** full table read (no filter DTO today)
- **MeterReading:** `WHERE customerId = ?` ORDER BY `createdAt` DESC

---

## 8. Snapshot triggers

| When | What to upsert |
|------|----------------|
| Login (online) | `Areas`, `DistributionBoxes` |
| Any successful list API call | That entity's returned page |
| Customer detail fetch | `Customers` row + `MeterReadings` for that id |
| Invoice detail fetch | `Invoices` row + related `Payments` |
| Connectivity restored | Re-fetch current screen's provider |

No full-database download — cache-as-you-go only.

---

## 9. UI rules (read-only)

- Banner when offline: **"Showing saved data"**
- Disable: add/edit/delete subscriber, pay invoice, add expense, meter reading CRUD
- `ampereScheduleProvider` screens: show online-required message
- Pull-to-refresh: online only

---

## 10. Implementation order

### Step 1 — Wire DB
- [ ] `appDatabaseProvider` → `AppDatabase()`
- [ ] Run / verify `database.g.dart` codegen

### Step 2 — Row mappers
- [ ] One mapper file per table: drift row → domain entity
- [ ] Rename `@DataClassName('Customer')` → `'CustomerRow'` (etc.) when ready

### Step 3 — Local DAOs
- [ ] `CustomerLocalSource.watch/get/query(filter)`
- [ ] Same pattern for Areas, Boxes, Invoices, Expenses, MeterReadings, Payments

### Step 4 — Repositories (reads only)
- [ ] Start with **Areas + DistributionBoxes** (smallest)
- [ ] Then **Customers** + filter translator
- [ ] Then **Invoices**, **Expenses**, **MeterReadings**

### Step 5 — Swap providers
- [ ] Replace `Service` calls in `build()` / read methods with `Repository`
- [ ] Keep mutations on `Service`; guard with `internetConnectionProvider`

### Step 6 — UX
- [ ] Offline banner (reuse `internetConnectionProvider`)
- [ ] Disable write actions when offline

---

## 11. Quick test checklist

- [ ] Online: open subscribers → data in SQLite (inspect `db.sqlite`)
- [ ] Airplane mode: subscribers list still shows last fetch
- [ ] Airplane mode: customer filters (name, area, status) work locally
- [ ] Airplane mode: add subscriber button disabled / shows message
- [ ] Airplane mode: dashboard / audit / ampere schedule → online message or empty

---

## 12. File map

| What | Path |
|------|------|
| DB entry | `lib/infrastructor/db/database.dart` |
| Tables | `lib/infrastructor/tables/` |
| Providers to migrate | `lib/data/providers/` |
| Filter DTOs | `lib/core/network/dto/request/*/*_filter_request.dart` |
| Connectivity | `lib/data/providers/network/internet_connection_provider.dart` |

---

## 13. Changelog

| Date | Change |
|------|--------|
| 2026-07-11 | Initial plan |
| 2026-07-11 | Read-only scope |
| 2026-07-11 | **Trimmed to 7 registered tables only** — removed AmpereSchedule, AuditLog, Company, SyncState, Outbox, and hypothetical schema gaps |

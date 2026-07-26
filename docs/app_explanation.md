# Shabakat — In-Depth Application Analysis

## 1. Overview

**Shabakat** (Arabic for "Networks") is a full-featured Flutter desktop/mobile application built for electricity billing and customer management, targeting local network providers and ISPs. It follows **Clean Architecture** with **Riverpod** state management, a **Drift (SQLite)** local database, and a **Dio**-based HTTP client for communicating with the Electro API backend.

The app supports **offline read-only mode**, **AI-powered chat assistant**, **WhatsApp invoice sharing**, **PDF invoice export**, **Arabic/English localization**, and **light/dark theming**.

---

## 2. Architecture

### 2.1 Layered Architecture

```
┌────────────────────────────────────────────────────────┐
│                   UI Layer (lib/ui/)                    │
│  Screens, Widgets, Shared Components, AI Chat, Settings│
├────────────────────────────────────────────────────────┤
│               Data Layer (lib/data/)                    │
│  Providers (Riverpod Notifiers), Repositories (Drift)  │
├────────────────────────────────────────────────────────┤
│              Domain Layer (lib/domain/)                 │
│  Entities (Freezed), Mappers (DTO <-> Entity <-> DB)   │
├────────────────────────────────────────────────────────┤
│         Infrastructure Layer (lib/infrastructor/)       │
│  Drift Database, Table Definitions, Migrations         │
├────────────────────────────────────────────────────────┤
│               Core Layer (lib/core/)                    │
│  Network (Dio, Services, DTOs), Themes, Storage, Enums │
├────────────────────────────────────────────────────────┤
│                    Electro API Backend                  │
│       REST API at /api/v1 (documented separately)      │
└────────────────────────────────────────────────────────┘
```

### 2.2 Data Flow Patterns

**Online flow:**

```
API (Electro Backend)
  → DioClient + Interceptors (Auth, Retry, AppVersion)
    → ApiExecutor (maps DioExceptions to ApiException)
      → *Service classes (CustomerService, InvoiceService, etc.)
        → Provider Notifiers (*Notifier with Riverpod)
          → UI Screens (via ref.watch)
```

**Offline read-only flow:**

```
API → *Service → *Mapper (DTO → Domain Entity) → *Repo (Drift upsert) → Local SQLite
UI → Provider → checks offlineMode → reads from *Repo (Drift) → Mapper (Drift row → Entity)
```

**Sync flow:**

```
OfflineSyncer.sync() → clears cache → fetches Areas → DistributionBoxes → Customers
→ Invoices → Expenses → MeterReadings → reports progress (0.0 - 1.0)
```

### 2.3 State Management Pattern

Each major entity follows a **triple-provider pattern**:

1. **`*FilterNotifier`** — holds filter state (search, pagination, date ranges)
2. **`*PaginationNotifier`** — holds pagination metadata (total count, current page, hasNextPage)
3. **`*Notifier`** — the main data provider, watches filter + pagination, builds `AsyncValue<List<Entity>>`

This separation keeps concerns isolated and allows widgets to watch only what they need.

---

## 3. Core Layer (`lib/core/`)

### 3.1 Constants

| File | Purpose |
|------|---------|
| `app_sizes.dart` | `AppSizes` extension on `BuildContext` — dynamic spacing/padding based on screen percentage, borderRadius constants, breakpoints (small/medium/large) |
| `api_errors.dart` | `ApiErrors` — static localized error message strings (noInternet, requestTimeout, unauthorized, etc.) |

### 3.2 Enums (11 total)

All use `@JsonEnum` for JSON serialization:

| Enum | Values | Purpose |
|------|--------|---------|
| `PlanType` | ampere, kilowatt, fixedKilowatt | Billing plan types |
| `PaymentMethod` | cash, wish | Payment methods |
| `InvoiceStatus` | unpaid, partiallypaid, paid | Invoice payment status |
| `ExpenseType` | fuel, maintenance, employees, other | Expense categories |
| `CustomerType` | residential, commercial, industrial | Customer classification |
| `CustomerStatus` | active, suspended, terminated | Customer lifecycle status |
| `CustomerRelation` | friend, family, owner | Relationship to provider |
| `AuditLogStatus` | success, failed | Audit outcome |
| `AuditEntityType` | customer, invoice, payment, expense | Entity types for audit |
| `AuditAction` | customerCreated, invoiceCreated, etc. (10 actions) | Specific audit events |
| `AppSnackBarVariant` | success, error, warning | Snackbar visual variants |

### 3.3 Exceptions

- **`ApiException`** (Freezed) — structured error with `userMessage`, `error` (technical), `statusCode`, `originalError`. Used throughout the entire network layer.

### 3.4 Network Layer

#### HTTP Client & Interceptors

- **`DioClient`** — configures Dio with base URL, timeouts, and 3 interceptors:
  - **`AuthInterceptor`** — reads token from `TokenStore`, attaches `Authorization: Bearer` header, handles 401 errors
  - **`RetryInterceptor`** — retries failed requests (connection timeout, 500+) up to 2 times with exponential backoff
  - **`AppVersionInterceptor`** — attaches `X-Client-Version` header via `package_info_plus`

#### API Request/Response

- **`ApiRequest<T>`** (Freezed sealed) — `path`, `method` (HttpMethod enum), `data`, `queryParams`, `headers`, `options`, `cancelToken`
- **`ApiResponse<T>`** (Freezed sealed with `ApiSuccess<T>` / `ApiFailure<T>`) — `isSuccess`/`isFailure` getters, `when()` pattern matching

#### ApiExecutor

The central HTTP execution engine. The `execute<T>(ApiRequest)` method:
1. Builds `RequestOptions` from the request
2. Calls `dio.fetch<dynamic>`
3. Parses the response data using a generic `T Function(Map<String, dynamic>)` fromJson callback
4. Handles pagination metadata from response headers
5. Maps all `DioException` types to user-friendly `ApiException` messages

#### Services (13 classes)

Each service is a Riverpod provider that depends on `DioClient` and `ApiExecutor`. All follow the same pattern:

```dart
Future<ApiResponse<List<CustomerResponse>>> getCustomers(CustomerFilterRequest filter) {
  return _executor.execute<List<CustomerResponse>>(
    ApiRequest(
      path: '/api/v1/customers',
      method: HttpMethod.get,
      queryParams: filter.toJson(),
    ),
    fromJson: (json) => ...,
  );
}
```

| Service | Key Methods |
|---------|-------------|
| **AuthService** | register, login, logout, getAccessToken |
| **TokenStore** | getAccessToken, persistAuthResponse, clear (FlutterSecureStorage) |
| **CustomerService** | CRUD + suspend, list with filters, unpaged fetch |
| **InvoiceService** | CRUD + bulkCreate, printPdf, payInvoice, fixedKilowattCalculate, skipped customers |
| **MeterReadingService** | getByCustomer, getLatest, create, delete |
| **ExpenseService** | CRUD with filters |
| **AreaService** | CRUD |
| **DistributionBoxService** | CRUD with filters |
| **DashboardService** | getSummary (all-in-one dashboard data) |
| **CompanyService** | updateProfile (multipart logo upload), getProfile, get/upsertPreferences |
| **AuditLogService** | list with filters (read-only) |
| **AmpereScheduleService** | CRUD |
| **AiService** | streamChat — SSE streaming with optional audio upload |

#### DTOs (~50 classes)

All are Freezed classes with `json_serializable`. Organized into `request/` and `response/` directories per entity. Each DTO exposes `fromJson()` and `toJson()`.

### 3.5 Storage

- **`SharedPreferencesHandler`** — wraps `SharedPreferencesAsync` for theme mode, offline mode, first launch flag, and general key-value storage. Uses in-memory cache for offline mode.
- **`SecureStorageAndroid`** — wraps `FlutterSecureStorage` for auth tokens. Provides setValue, getValue, deleteValue, clear, verifyValue.

### 3.6 Theming System

The theming system enforces a strict "single source of truth" architecture:

1. **`AppColors`** — all color constants (dark + light variants)
2. **`AppGradients`** — `LinearGradient` presets built from `AppColors`
3. **`ControlsThemes`** — static factory methods for Material component themes (Card, ElevatedButton, InputDecoration, DropdownMenu, AppBar, BottomNavigationBar, Chip, FAB, StatCard, StatusBadge)
4. **`ThemeSelector`** — assembles complete `ThemeData` using `AppColors` + `ControlsThemes` + `GoogleFonts.interTextTheme()`
5. **`ThemeModeNotifier`** — Riverpod provider persisting `ThemeMode` (system/light/dark)

The "Zero Hardcoding Rule" (defined in `AGENTS.md`) mandates that all widget styling must come from `ThemeData`, never from inline style parameters.

### 3.7 Utilities

| Utility | Purpose |
|---------|---------|
| `InternetConnectionHelper` | Wraps `connectivity_plus` — streams connection status, supports start/stop listening |
| `DecimalAmount` | `formatDecimalAmount()` strips trailing zeros, `amountExceedsDue()` handles floating-point comparison |
| `DayOfMonthFormatter` | Ordinal day formatting (English/Arabic), date-from-day construction |
| `ImagePickerHelper` | Camera/gallery picking with 2MB size validation |
| `InvoicePdfExporter` | Saves PDF bytes to Downloads folder, shares via SharePlus |
| `WhatsAppShareService` | Shares invoice PDF to WhatsApp (resolves consumer/business package, cleans phone numbers) |
| `TempAudioStore` | Manages temporary AI audio recording files with cleanup |
| `OfflineSyncer` | Orchestrates full offline data sync — clears cache, fetches all entities in FK order, reports progress |

---

## 4. Data Layer (`lib/data/`)

### 4.1 Providers (Riverpod Notifiers)

All providers follow this general interface:

```dart
class CustomerNotifier extends _$CustomerNotifier {
  Future<void> refresh() async { ... }
  Future<void> addCustomer(...) async { ... }
  Future<void> updateCustomer(...) async { ... }
  Future<void> deleteCustomer(...) async { ... }
}
```

**Entity providers** (all `keepAlive`, `AsyncValue<List<Entity>>` state):

| Provider | State | Offline | Mutations |
|----------|-------|---------|-----------|
| `CustomerNotifier` | List\<Customer\> | ✅ | add, update, delete, suspend |
| `InvoiceNotifier` | List\<Invoice\> | ✅ | create, bulkCreate, update, delete, pay |
| `ExpenseNotifier` | List\<Expense\> | ✅ | create, update, delete |
| `AreaNotifier` | List\<Area\> | ✅ | create, update, delete |
| `DistributionBoxNotifier` | List\<DistributionBox\> | ✅ | create, update, delete |
| `MeterReadingNotifier` | List\<MeterReading\> | ✅ | create, delete |
| `DashboardNotifier` | DashboardSummaryResponse | ❌ | refresh only |
| `CompanyNotifier` | CompanyPreferences | ❌ | upsertPreferences |
| `CompanyProfileNotifier` | Company | ❌ | updateProfile |
| `AmpereScheduleNotifier` | List\<AmpereSchedule\> | ❌ | CRUD |
| `AuditLogNotifier` | List\<AuditLog\> | ❌ | infinite scroll (loadMore) |

**Filter providers** hold filter request state with pagination helpers.
**Pagination providers** hold pagination metadata (totalCount, pageNumber, pageSize, hasNextPage).

**Special providers:**
- `aiChatProvider` — stream provider that SSE-streams AI responses via `AiService.streamChat()`
- `syncingProgress` — exposes `OfflineSyncer.progressStream` as a Riverpod stream
- `authStateProvider` — `AsyncValue<bool>` checking token existence
- `internetConnectionProvider` — `bool` stream from `connectivity_plus`

### 4.2 Repositories (Drift Local Database)

Six repository classes provide local CRUD operations. Each:

- Uses the same filter-model structure as the API service for seamless online/offline switching
- Builds dynamic Drift `WHERE` expressions from filter parameters (excluding `paymentFilter` which is online-only)
- Supports bulk operations for offline sync (`bulkAddCustomers`, `bulkDeleteInvoices`, etc.)

| Repository | Table(s) | Key Operations |
|------------|----------|----------------|
| `CustomerRepo` | customers | getAll, getById, add, bulkAdd, getTotalCount, getIds, deleteById, delete, bulkDelete |
| `InvoiceRepo` | invoices, payments | getAll, getByIdWithPayments (join), add (with payment cache), bulkAdd, addPayment, getTotalCount, delete |
| `ExpenseRepo` | expenses | getAll, getById, add, bulkAdd, getTotalCount, delete |
| `AreaRepo` | areas | getAll, getById, add, bulkAdd, getTotalCount, delete |
| `DistributionBoxRepo` | distributionBoxes | getAll, getById, add, bulkAdd, getTotalCount, delete |
| `MeterReadingRepo` | meterReadings | getByCustomerId, add, bulkAdd, delete |

---

## 5. Domain Layer (`lib/domain/`)

### 5.1 Entities (10 Freezed classes)

All entities are immutable Freezed classes with `fromJson()` factory constructors:

| Entity | Key Fields |
|--------|------------|
| **Customer** | id, name, phone, address, building, floor, cableName, boxId/boxName, areaName/areaId, customerType, customerRelation, subscriptionDate, customerStatus, plan, planValue, pricingOverrides, totalBilled/Paid/Outstanding, ampereScheduleId/Name |
| **Invoice** | id, customerId, customerName, invoiceNumber, issueDate, dueDate, fixedCharge, tva, totalAmount, paidAmount, amountDue, billedConsumption, invoiceStatus, payments list |
| **Payment** | id, companyId, customerId, invoiceId, amount, paymentMethod, paymentDate, notes |
| **MeterReading** | id, readingValue, consumption (nullable), createdAt |
| **Expense** | id, expenseType, expenseDate, amount, label, notes |
| **Area** | id, companyId, name, customerCount |
| **DistributionBox** | id, name, areaId, areaName, locationNote, notes, customerCount |
| **AmpereSchedule** | id, name, hoursPerDay, pricePerAmp, perCustomerType pricing map, customerCount, canBeDeleted |
| **AuditLog** | id, action, status, messageKey, parameters, entityType, entityId, userEmail, errorMessage |
| **Company (User)** | id, name, logoUrl, isBanned |
| **CompanyPreferences** | pricePerKilowat, pricePerAmp, fixedCharge, tva, perCustomerType pricing, language, dueDate, triggerDate, triggerMessage, ampereSchedulePricingEnabled, ampereProrateByDaysEnabled |

### 5.2 Mappers (10 extension classes)

Each mapper converts between three representations:

```
DTO Response  ───toEntity()──→  Domain Entity
Domain Entity ───toCompanion()─→ Drift Companion (for DB insert/update)
Drift Row     ───toEntity()───→ Domain Entity
```

Example from `CustomerMapper`:
- `CustomerResponseMapper.toEntity()` — API DTO → Entity
- `CustomerSummaryResponseMapper.toEntity()` — list item DTO → Entity
- `CustomerWithInvoicesResponseMapper.toEntity()` — detail DTO → Entity (with invoices)
- `CustomerEntityMapper.toCompanion()` — Entity → Drift companion
- `CustomerDriftMapper.toEntity()` — Drift row → Entity

---

## 6. Infrastructure Layer (`lib/infrastructor/`)

### 6.1 Database

- **`AppDatabase`** extends `_$AppDatabase` (Drift generated)
- 7 registered tables, schema version 1
- SQLite file at `getApplicationDocumentsDirectory()/db.sqlite`
- Uses `NativeDatabase.createInBackground()` for non-blocking initialization
- Enables `PRAGMA foreign_keys = ON` on open

### 6.2 Tables (7 Drift definitions)

| Table | Primary Key | Foreign Keys | Indices |
|-------|-------------|--------------|---------|
| `Areas` | id | — | name |
| `DistributionBoxes` | id | areaId → Areas.id | areaId |
| `Customers` | id | boxId → DistributionBoxes.id, areaId → Areas.id | name, phone, areaId, boxId, plan, customerRelation, customerStatus |
| `Invoices` | id | customerId → Customers.id | customerId, issueDate, dueDate, invoiceStatus |
| `Payments` | id | customerId → Customers.id, invoiceId → Invoices.id | customerId, invoiceId, paymentDate |
| `ExpensesTable` | id | — | expenseType, expenseDate |
| `MeterReadings` | id | customerId → Customers.id | customerId, createdAt |

The FK dependency order is critical for offline sync: **Areas → DistributionBoxes → Customers → Invoices/Payments/MeterReadings/Expenses**.

---

## 7. Presentation Layer (`lib/ui/`)

### 7.1 App Entry & Navigation

- **`main.dart`** — initializes localization (`EasyLocalization` with en/ar), wraps in `ProviderScope`, sets up light/dark/system theming, launches `SplashScreen`
- **`SplashScreen`** — animated splash with ripple circles, icon animation, title slide-in. On completion, checks auth state → navigates to `MainTabPage` or `LoginScreen`
- **`MainTabPage`** — the app shell with:
  - `PageView` (6 tabs: Dashboard, Subscribers, Invoices, Expenses, Areas, Distribution Boxes)
  - `BottomNavContainer` — LucideIcons-based bottom navigation
  - `AppDrawer` — settings, audit logs, AI chat, fixed kilowatt calculator, offline mode toggle
  - `EdgeDraggableFab` — draggable FAB for AI chat access
  - Internet connection monitoring with snackbar notifications

### 7.2 Screens

| Screen | Directory | Features |
|--------|-----------|----------|
| **Login** | `auth/login/` | Email/password auth, registration link |
| **Dashboard** | `dashboard/` | Stat cards, revenue chart, invoice overview, customer breakdown, expenses by type, upcoming dues, recent payments; date-range filter |
| **Subscribers** | `subscribers/` | Search, filter (name/phone/area/plan/status/relation/payment), pagination, CRUD, suspend, bulk selection, details with invoices & meter readings, box/area selection dialogs |
| **Invoices** | `invoices/` | List with filters, pagination, create/update/delete, bulk create, payment recording, print/share |
| **Expenses** | `expenses/` | List with date/type filters, CRUD |
| **Areas** | `areas/` | List with CRUD, detail view showing associated boxes & customers |
| **Distribution Boxes** | `distribution_box/` | List with area filter, CRUD |
| **Audit Logs** | `audit/` | Infinite scroll list with filters (action/status/date range), detail view |
| **Settings** | `settings/` | Company profile with logo upload, preferences editor (pricing, TVA, due dates, trigger message, language, theme), ampere schedule management |
| **Fixed Kilowatt Calculator** | `calculator/` | Payment↔kWh conversion preview tool |
| **AI Chat** | `ai/` | Full chat UI via `flutter_chat_ui`, markdown rendering, audio recording/playback, SSE streaming |

### 7.3 Shared Components

| Component | Purpose |
|-----------|---------|
| `AppSnackBar` | Themed success/error/warning snackbars using `AppColors` |
| `AppModal` / `AppDialog` | Reusable bottom sheets and dialogs |
| `DynamicError` | Reusable error state widget |
| `DynamicInnerScreen` | Standard screen wrapper for push navigation |
| Skeleton widgets (8) | Loading states for every entity list |
| `StatusBadge` | Color-coded paid/unpaid/overdue badges |
| `EdgeDraggableFab` | Draggable FAB for persistent AI access |
| `OfflineSyncDialog` | Sync progress dialog with percentage |

### 7.4 Widget Principles

The project enforces strict widget rules (from `AGENTS.md`):
- All colors from `AppColors` via theme
- All padding/spacing from `AppSizes` extension
- All text styles from `Theme.of(context).textTheme`
- Component styling from `ControlsThemes` (never inline)
- Overrides via `Theme.of(context).<property>.copyWith()` only

---

## 8. Offline Mode

### 8.1 Strategy: Read-Only Offline

The app uses a **snapshot-on-fetch** strategy:
1. When online, every successful API list/detail call triggers a cache update
2. When offline, the UI reads exclusively from Drift
3. Writes are blocked in offline mode (banner notification + disabled buttons)

### 8.2 Sync Orchestration

`OfflineSyncer.sync()` performs a full cache refresh:
1. Clears all Drift tables
2. Fetches all Areas (API) → upserts to Drift
3. Fetches all DistributionBoxes → upserts
4. Fetches all Customers → upserts
5. Fetches all Invoices → upserts (with payment caching)
6. Fetches all Expenses → upserts
7. Fetches MeterReadings per customer → upserts
8. Reports progress via `StreamController<double>` (0.0 → 1.0)

### 8.3 Snapshots Triggers

Cache is updated on:
- App launch (if previously synced)
- Successful API list response
- Successful API detail response (single entity)
- Connectivity restored (prompts sync dialog)

### 8.4 Offline Filter Support

Most filter parameters work offline (generated from Drift WHERE clauses), except:
- `paymentFilter` (payment status on invoices) — online-only
- Dashboard summary — online-only (complex aggregations)

---

## 9. Key Technical Decisions

### 9.1 Why Freezed + JsonSerializable?

- Immutable data classes with generated `==`, `hashCode`, `copyWith`
- Generated `fromJson`/`toJson` for zero-boilerplate API serialization
- Sealed unions for `ApiResponse` (success/failure) and `ApiRequest`
- `@JsonEnum` for enum serialization

### 9.2 Why Riverpod (with Generator)?

- Compile-time safety over Provider
- Family modifiers for parameterized providers (single entity lookups)
- `.autoDispose` for ephemeral state
- `riverpod_generator` reduces boilerplate with code gen
- Built-in `AsyncValue` for loading/error/data states

### 9.3 Why Drift?

- Type-safe SQL with Dart code generation
- First-class FK support
- Stream queries for reactive UI
- Background database initialization
- Easy migration path (schema versions)

### 9.4 Why SSE for AI Chat?

- `AiService.streamChat()` uses HTTP streaming (`ResponseType.stream`)
- Custom SSE parser (`_parseSse`) handles Server-Sent Events
- Allows real-time token-by-token AI response display
- Supports audio file upload alongside text prompts

---

## 10. API Integration

### 10.1 Base Endpoints

All endpoints are under `/api/v1` and documented in `shabakat_endpoints_documentation.md` (1,541 lines). The API covers:

- **Auth** — register company, login, create employee
- **Customers** — full CRUD with filtering, soft delete, suspend
- **Meter Readings** — CRUD per customer
- **Invoices** — full CRUD, bulk create, PDF print, payment recording
- **Dashboard** — aggregated summary with billing stats, customer counts, expense breakdowns
- **Expenses** — CRUD with date/type filters
- **Areas & Distribution Boxes** — hierarchical CRUD
- **Ampere Schedules** — supply-hour tier management
- **Company Profile & Preferences** — JSON + multipart logo, all pricing configs
- **Audit Logs** — read-only list with filters
- **WhatsApp** — connect (QR), status, disconnect
- **Background Jobs** — Hangfire-based reminder triggers, invoice suspension

### 10.2 Interceptors

Three Dio interceptors create a robust network layer:
1. **Auth** — automatic token injection + 401 handling
2. **Retry** — automatic retry with exponential backoff (2 max)
3. **App Version** — consistent client version header

---

## 11. Project Statistics

| Category | Count |
|----------|-------|
| Total Dart files | ~300+ |
| Entity classes (Freezed) | 11 |
| DTO classes | ~50 |
| API service classes | 13 |
| Riverpod providers | ~40+ |
| Drift tables | 7 |
| Repository classes | 6 |
| Mapper extension files | 10 |
| UI screens | ~20 |
| Translation strings (per locale) | ~900+ |
| API documentation | 1,541 lines |
| Localization support | 2 (en, ar) |
| Themify system | 5 files |

---

## 12. Build & Development

### Prerequisites
- Flutter SDK (>=3.35.0)
- Dart SDK (^3.11.5)

### Key Commands
| Command | Purpose |
|---------|---------|
| `flutter pub get` | Install dependencies |
| `dart run build_runner build --delete-conflicting-outputs` | Generate code (Freezed, Riverpod, JsonSerializable, Drift) |
| `flutter run` | Run the application |
| `flutter test` | Run tests |

### Linting
- Uses `flutter_lints` + `riverpod_lint`
- Excludes: `*.g.dart`, `*.freezed.dart`, `build/`, `.dart_tool/`

---

## 13. Conclusion

Shabakat is a production-grade Flutter application demonstrating:

- **Clean Architecture** with strict layer separation (core/domain/data/infrastructor/ui)
- **Reactive state management** via Riverpod's notifier/stream/family patterns
- **Offline resilience** through Drift-based local caching with orchestrated sync
- **Comprehensive theming** with a "zero hardcoding" philosophy
- **Rich API integration** with 13 service classes, 3 interceptors, and full error handling
- **AI integration** with SSE streaming chat and audio recording
- **Full localization** (English/Arabic) and theming (light/dark)

The app serves as a complete ERP-lite for small electricity providers, managing the full customer lifecycle from subscription to billing, payment collection, expense tracking, and operational analytics.

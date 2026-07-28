# Invoice Breakdown (Partition) — App-Level Spec

Shared contract for Flutter and web: how to reverse an invoice `totalAmount` into **Charge**, **Fixed charge**, and **TVA**, and when **plan value** is part of the charge.

Source of truth in the Flutter app:

- Params: `lib/data/providers/invoice/invoice_breakdown_params_provider.dart`
- Math: `lib/ui/screens/invoices/widgets/invoice_details/invoice_breakdown.dart`

---

## Inputs

| Source | Fields |
|--------|--------|
| **Invoice** | `id`, `customerId`, `totalAmount`, `fixedCharge`, `tva` (rate %), `consumptionStart` (mapped as issue date), `invoiceNumber`, `createdAt` |
| **Customer** (via `customerId`) | `plan` (`ampere` \| `kilowatt` \| `fixedKilowatt`), `planValue` |

`planValue` is **not** on the invoice response. Always load it from the customer.

---

## Step 1 — Resolve `includePlanValue`

Load the customer by `invoice.customerId`. Then:

| Customer plan | `includePlanValue` |
|---------------|--------------------|
| `ampere` | `false` |
| `kilowatt` | `true` |
| `fixedKilowatt` | `true` only if this invoice is the **first** for that customer in the same **consumption-start calendar month** (see Step 1b) |

If `customerId` is missing/empty: treat as no plan value (`includePlanValue = false`, `planValue = 0`).

### Step 1b — Fixed kilowatt: first invoice of the month

1. Let `start` = invoice `consumptionStart` (date-only).
2. Query that customer’s invoices with:
   - `consumptionStartFrom` = first day of that month  
   - `consumptionStartTo` = last day of that month  
   - large enough page size (app uses 100)
3. Ask: is there any **other** sibling invoice in that month that sorts **before** the current one?
   - Prefer lower `invoiceNumber`
   - If equal, prefer earlier `createdAt`
4. `includePlanValue = !hasEarlierSibling`

Pseudo:

```ts
function isFirstInvoiceOfMonth(invoice, siblings): boolean {
  const start = invoice.consumptionStart;
  const hasEarlier = siblings.some((s) => {
    if (s.id === invoice.id) return false;
    if (yearMonth(s.consumptionStart) !== yearMonth(start)) return false;
    if (s.invoiceNumber !== invoice.invoiceNumber) {
      return s.invoiceNumber < invoice.invoiceNumber;
    }
    return s.createdAt < invoice.createdAt;
  });
  return !hasEarlier;
}
```

---

## Step 2 — Partition math (same for all plans)

```ts
const addedPlanValue = includePlanValue ? customer.planValue : 0;
const taxableTotal = invoice.totalAmount - addedPlanValue;
const fixedCharge = invoice.fixedCharge;
const tvaRate = invoice.tva; // percent, e.g. 11

if (tvaRate <= 0) {
  charge = taxableTotal - fixedCharge;
  tvaAmount = 0;
} else {
  const rate = tvaRate / 100;
  const subtotal = taxableTotal / (1 + rate); // pre-tax: charge + fixedCharge
  charge = subtotal - fixedCharge;
  tvaAmount = subtotal * rate;
}

displayedCharge = charge + addedPlanValue;
```

### What the UI shows

| Row | Value |
|-----|--------|
| **Charge** | `displayedCharge` (= consumption/ampere charge **plus** plan value when included) |
| **Fixed charge** | `invoice.fixedCharge` |
| **TVA (x%)** | `tvaAmount` |

Plan value is **merged into Charge**, not a separate row.

---

## Backend billing formulas (for context)

What the server roughly computes (forward). The app only reverse-partitions the stored total.

### Ampere

Plan value is an ampere **count**, baked into the energy charge (`unitPrice × planValue`). It is **not** added after TVA.

```
total = (ampereCharge + fixedCharge) × (1 + tva/100)
```

→ App: `includePlanValue = false`.

### Kilowatt

```
total = (consumption × unitPrice + fixedCharge) × (1 + tva/100) + planValue
```

→ App: always `includePlanValue = true`.  
Displayed charge ≈ `(consumption × unitPrice) + planValue`.

### Fixed kilowatt

Same forward formula as kilowatt, but **`planValue` is added only on the first invoice of the month** for that customer. Later invoices that month omit the trailing `+ planValue`.

→ App: Step 1b.

---

## Worked example (kilowatt / first fixed-kW of month)

Given:

- `consumption × unitPrice` = 88  
- `fixedCharge` = 0  
- `tva` = 11  
- `planValue` = 3  
- `totalAmount` = 100.68  

With `includePlanValue = true`:

```
taxableTotal = 100.68 - 3 = 97.68
subtotal     = 97.68 / 1.11 = 88
charge       = 88 - 0 = 88
tvaAmount    = 88 × 0.11 = 9.68
displayedCharge = 88 + 3 = 91
```

UI: Charge **$91.00**, Fixed **$0.00**, TVA **$9.68**.

If the same numbers were a **later** fixed-kW invoice in that month (`includePlanValue = false`), you would **not** subtract 3 from total — that would mis-partition.

---

## Checklist for web

1. Invoice detail must expose `customerId`.
2. Fetch customer → `plan` + `planValue`.
3. Compute `includePlanValue` from the table above (fixed kW → sibling month query).
4. Run Step 2 math.
5. Show Charge as `displayedCharge` (charge + included plan value).
6. Do not show a separate plan-value line.

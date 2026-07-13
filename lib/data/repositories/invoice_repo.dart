import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/core/enums/invoice_status.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';
import 'package:shabakat/domain/mappers/payment/payment_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class InvoiceRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  InvoiceRepo(this._db);

  Future<List<Invoice>> getAllInvoices(
    String? customerId,
    InvoiceStatus? invoiceStatus,
    DateTime? issueDateFrom,
    DateTime? issueDateTo, {
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final select = _db.select(_db.invoices);

      final expressions = <Expression<bool>>[];
      if (customerId != null) {
        expressions.add(_db.invoices.customerId.equals(customerId));
      }
      if (invoiceStatus != null) {
        expressions.add(_db.invoices.invoiceStatus.equals(invoiceStatus.name));
      }
      if (issueDateFrom != null) {
        expressions.add(
          _db.invoices.issueDate.isBiggerOrEqualValue(issueDateFrom),
        );
      }
      if (issueDateTo != null) {
        expressions.add(
          _db.invoices.issueDate.isSmallerOrEqualValue(issueDateTo),
        );
      }
      if (expressions.isNotEmpty) {
        select.where((i) => expressions.reduce((a, b) => a & b));
      }
      final query = select
        ..orderBy([(i) => OrderingTerm.desc(i.issueDate)])
        ..limit(pageSize, offset: (pageNumber - 1) * pageSize);
      final rows = await query.get();
      final invoices = rows.map((e) => e.toEntity()).toList();
      _logger.i('Invoices retrieved from local DB: ${invoices.length}');
      return invoices;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve invoices from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<Invoice?> getInvoiceByIdWithPayments(String id) async {
    try {
      final row = await (_db.select(_db.invoices)..where((i) => i.id.equals(id)))
          .getSingleOrNull();
      if (row == null) return null;

      final paymentRows = await (_db.select(_db.payments)
            ..where((p) => p.invoiceId.equals(id))
            ..orderBy([(p) => OrderingTerm.desc(p.paymentDate)]))
          .get();

      final invoice = row.toEntity().copyWith(
        payments: paymentRows.map((e) => e.toEntity()).toList(),
      );
      _logger.i(
        'Invoice with payments retrieved from local DB by id: $id (${paymentRows.length} payments)',
      );
      return invoice;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve invoice from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addInvoice(Invoice invoice) async {
    try {
      await _db.transaction(() async {
        await _db.into(_db.invoices).insert(
              invoice.toCompanion(),
              mode: InsertMode.insertOrReplace,
            );

        final payments = invoice.payments;
        if (payments != null) {
          await (_db.delete(_db.payments)
                ..where((p) => p.invoiceId.equals(invoice.id)))
              .go();
          if (payments.isNotEmpty) {
            await _db.batch((b) {
              for (final payment in payments) {
                b.insert(
                  _db.payments,
                  payment.toCompanion(),
                  mode: InsertMode.insertOrReplace,
                );
              }
            });
          }
        }
      });
      _logger.i('Invoice added to local DB: ${invoice.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add invoice to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddInvoices(List<Invoice> invoices) async {
    try {
      await _db.batch((b) {
        for (final invoice in invoices) {
          b.insert(
            _db.invoices,
            invoice.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i('Bulk added invoices to local DB: ${invoices.length}');
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add invoices to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> getTotalInvoicesCount() async {
    try {
      final count = _db.invoices.id.count();
      final query = _db.selectOnly(_db.invoices)..addColumns([count]);
      final row = await query.getSingle();
      final total = row.read(count) ?? 0;
      _logger.i('Total invoices count from local DB: $total');
      return total;
    } catch (e, st) {
      _logger.e(
        'Failed to get total invoices count from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteInvoiceById(String id) async {
    try {
      final deleted =
          await (_db.delete(_db.invoices)..where((i) => i.id.equals(id))).go();
      _logger.i('Deleted invoice from local DB by id: $id ($deleted rows)');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete invoice from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteInvoices() async {
    try {
      final deleted = await (_db.delete(_db.invoices)).go();
      _logger.i('Bulk deleted all invoices from local DB: $deleted rows');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete invoices from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}

import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/dto/request/invoice/add_payment_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/bulk_create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/create_invoice_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/core/network/dto/request/invoice/update_invoice_request.dart';
import 'package:shabakat/core/network/dto/response/invoice/bulk_create_invoice_response.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_response.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_summary_response.dart';
import 'package:shabakat/core/network/dto/response/payment/payment_response.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';
part 'invoice_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
InvoiceService invoiceService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return InvoiceService(apiExecutor);
}

class InvoiceService {
  late final ApiExecutor _apiExecutor;
  final _logger = Logger();
  InvoiceService(this._apiExecutor);

  Future<List<InvoiceSummaryResponse>> getInvoices(
    InvoiceFilterRequest filter,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices',
        method: HttpMethod.get,
        queryParams: {
          if (filter.customerId != null) 'customerId': filter.customerId,
          if (filter.invoiceStatus != null) 'invoiceStatus': filter.invoiceStatus,
          if (filter.issueDateFrom != null) 'issueDateFrom': filter.issueDateFrom,
          if (filter.issueDateTo != null) 'issueDateTo': filter.issueDateTo,
          'pageNumber': filter.pageNumber,
          'pageSize': filter.pageSize,
        },
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Invoices retrieved successfully: $data');
        final datalist = data as Map<String, dynamic>;
        final invoices = (datalist['data'] as List)
            .map((x) => InvoiceSummaryResponse.fromJson(x))
            .toList();
        return invoices;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve invoices: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<InvoiceResponse> getInvoiceById(String id) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'invoices/$id', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Invoice retrieved successfully: $data');
        return InvoiceResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve invoice: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<List<PaymentResponse>> getPayments(String invoiceId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(path: 'invoices/$invoiceId/payments', method: HttpMethod.get),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Payments retrieved successfully: $data');
        final payments = (data as List)
            .map((x) => PaymentResponse.fromJson(x))
            .toList();
        return payments;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to retrieve payments: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> createInvoice(CreateInvoiceRequest request) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Invoice created successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to create invoice: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<BulkCreateInvoiceResponse> bulkCreate(
    BulkCreateInvoiceRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices/bulk',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Bulk invoices created successfully: $data');
        return BulkCreateInvoiceResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to bulk create invoices: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> payInvoice(
    String invoiceId,
    AddPaymentRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices/$invoiceId/pay',
        method: HttpMethod.post,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Payment recorded successfully: $data');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to record payment: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<InvoiceResponse> updateInvoice(
    String invoiceId,
    UpdateInvoiceRequest request,
  ) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices/$invoiceId',
        method: HttpMethod.put,
        data: request.toJson(),
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Invoice updated successfully: $data');
        return InvoiceResponse.fromJson(data);
      },
      failure: (error, statusCode) {
        _logger.e('Failed to update invoice: ${error.toString()}');
        throw error;
      },
    );
  }

  Future<void> deleteInvoice(String invoiceId) async {
    final response = await _apiExecutor.execute(
      ApiRequest(
        path: 'invoices/$invoiceId',
        method: HttpMethod.delete,
      ),
    );
    return response.when(
      success: (data, statusCode, meta) {
        _logger.i('Invoice deleted successfully');
        return;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to delete invoice: ${error.toString()}');
        throw error;
      },
    );
  }
}

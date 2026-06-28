import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';

class InvoicePrintPreviewScreen extends ConsumerStatefulWidget {
  final String invoiceId;

  const InvoicePrintPreviewScreen({super.key, required this.invoiceId});

  @override
  ConsumerState<InvoicePrintPreviewScreen> createState() =>
      _InvoicePrintPreviewScreenState();
}

class _InvoicePrintPreviewScreenState
    extends ConsumerState<InvoicePrintPreviewScreen> {
  String? _html;
  Object? _error;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(_loadHtml);
  }

  Future<void> _loadHtml() async {
    setState(() {
      _error = null;
      _isLoading = true;
      _html = null;
    });

    try {
      final html = await ref
          .read(invoiceServiceProvider)
          .printInvoice(widget.invoiceId);
      if (!mounted) return;
      setState(() {
        _html = html;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.x),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'invoices.print.title'.tr(),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return DynamicError(
        text: _error is ApiException
            ? (_error! as ApiException).userMessage
            : 'invoices.print.load_failed'.tr(),
        onTryAgain: _loadHtml,
      );
    }

    return InAppWebView(
      initialData: InAppWebViewInitialData(
        data: _html!,
        mimeType: 'text/html',
        encoding: 'utf-8',
      ),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        transparentBackground: true,
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_skipped_response.dart';
import 'package:shabakat/data/providers/invoice/invoice_provider.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/bulk_create_skipped_skeleton.dart';

import '../widgets/bulk_create/bulk_create_skipped_card.dart';

class BulkCreateSkippedScreen extends ConsumerStatefulWidget {
  const BulkCreateSkippedScreen({super.key});

  @override
  ConsumerState<BulkCreateSkippedScreen> createState() =>
      _BulkCreateSkippedScreenState();
}

class _BulkCreateSkippedScreenState
    extends ConsumerState<BulkCreateSkippedScreen> {
  bool _isLoading = true;
  List<InvoiceSkippedResponse>? _items;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final items =
          await ref.read(invoiceProvider.notifier).getInvoiceSkipped();
      if (!mounted) return;
      setState(() {
        _items = items;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e is ApiException
            ? e.userMessage
            : 'invoices.bulk_create.skipped_load_failed'.tr();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('invoices.bulk_create.skipped_details_title'.tr()),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const BulkCreateSkippedSkeleton();
    }

    if (_errorMessage != null) {
      return DynamicError(
        text: _errorMessage!,
        onTryAgain: _load,
      );
    }

    final items = _items ?? [];

    if (items.isEmpty) {
      return Center(child: Text('invoices.bulk_create.skipped_empty'.tr()));
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(context.paddingMedium),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: context.spaceSmall),
            child: BulkCreateSkippedCard(item: items[index]),
          );
        },
      ),
    );
  }
}

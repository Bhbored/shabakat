import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';

import '../invoice_card/invoice_card.dart';

class InvoiceList extends StatelessWidget {
  final List<Invoice> invoices;
  final bool readOnly;

  const InvoiceList({
    super.key,
    required this.invoices,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    if (invoices.isEmpty) {
      final theme = Theme.of(context);
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: context.screenHeight * 0.2),
          Center(
            child: Text(
              'invoices.empty_list'.tr(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: context.paddingMedium),
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: InvoiceCard(
            invoice: invoices[index],
            readOnly: readOnly,
          ),
        );
      },
    );
  }
}

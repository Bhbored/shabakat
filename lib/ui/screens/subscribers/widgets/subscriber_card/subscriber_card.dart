import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/subscriber_details_screen.dart';
import 'subscriber_card_details.dart';
import 'subscriber_card_header.dart';

class SubscriberCard extends StatelessWidget {
  final Customer customer;
  final bool selectionMode;
  final bool isSelected;
  final VoidCallback onLongPress;
  final ValueChanged<bool> onSelectionChanged;

  const SubscriberCard({
    super.key,
    required this.customer,
    required this.selectionMode,
    required this.isSelected,
    required this.onLongPress,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: selectionMode
            ? () => onSelectionChanged(!isSelected)
            : () {
                Navigator.of(context).push(
                  openInnerScreen(
                    widget: SubscriberDetailsScreen(customerId: customer.id),
                  ),
                );
              },
        onLongPress: selectionMode ? null : onLongPress,
        child: Padding(
          padding: EdgeInsets.all(context.paddingSmall),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selectionMode) ...[
                Checkbox(
                  value: isSelected,
                  onChanged: (value) => onSelectionChanged(value ?? false),
                ),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SubscriberCardHeader(customer: customer),
                    SizedBox(height: context.spaceSmall),
                    const Divider(),
                    SizedBox(height: context.spaceSmall),
                    SubscriberCardDetails(customer: customer),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

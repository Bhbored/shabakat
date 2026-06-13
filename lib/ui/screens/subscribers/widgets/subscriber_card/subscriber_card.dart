import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/subscriber_details_screen.dart';
import 'subscriber_card_details.dart';
import 'subscriber_card_header.dart';

class SubscriberCard extends StatelessWidget {
  final Customer customer;

  const SubscriberCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            openInnerScreen(
              widget: SubscriberDetailsScreen(customerId: customer.id),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(context.paddingSmall),
          child: Column(
            children: [
              SubscriberCardHeader(customer: customer),
              SizedBox(height: context.spaceSmall),
              const Divider(),
              SizedBox(height: context.spaceSmall),
              SubscriberCardDetails(customer: customer),
            ],
          ),
        ),
      ),
    );
  }
}

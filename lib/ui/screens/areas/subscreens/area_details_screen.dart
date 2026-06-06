import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import '../widgets/area_customers_section/area_customers_section.dart';
import '../widgets/area_details_header/area_details_header.dart';

class AreaDetailsScreen extends ConsumerStatefulWidget {
  final Area area;

  const AreaDetailsScreen({super.key, required this.area});

  @override
  ConsumerState<AreaDetailsScreen> createState() => _AreaDetailsScreenState();
}

class _AreaDetailsScreenState extends ConsumerState<AreaDetailsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(customerFilterProvider.notifier).updateAreaFilter(widget.area.id);
    });
  }

  void _resetFilterAndPop() {
    ref.read(customerFilterProvider.notifier).reset();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          ref.read(customerFilterProvider.notifier).reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: _resetFilterAndPop,
          ),
          title: Text(
            'Area Details',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AreaDetailsHeader(area: widget.area),
            const AreaCustomersSection(),
          ],
        ),
      ),
    );
  }
}

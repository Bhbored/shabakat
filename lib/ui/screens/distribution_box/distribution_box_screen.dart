import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';

import 'widgets/distribution_box_filter_chips/distribution_box_filter_chips_row.dart';
import 'widgets/distribution_box_list/distribution_box_list.dart';
import 'widgets/distribution_box_toolbar/distribution_box_toolbar.dart';

class DistributionBoxScreen extends ConsumerStatefulWidget {
  const DistributionBoxScreen({super.key});

  @override
  ConsumerState<DistributionBoxScreen> createState() =>
      _DistributionBoxScreenState();
}

class _DistributionBoxScreenState extends ConsumerState<DistributionBoxScreen> {
  String? _nameQuery;

  List<DistributionBox> _filterByName(List<DistributionBox> boxes) {
    final query = _nameQuery?.trim().toLowerCase();
    if (query == null || query.isEmpty) return boxes;
    return boxes
        .where((box) => box.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final boxesAsync = ref.watch(distributionBoxProvider);
    final boxes = boxesAsync.asData?.value ?? [];
    final filtered = _filterByName(boxes);

    return boxesAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'Failed to load distribution boxes.',
        onTryAgain: () => ref.read(distributionBoxProvider.notifier).refresh(),
      ),
      data: (_) => _DistributionBoxLayout(
        nameQuery: _nameQuery,
        onNameQueryChanged: (value) => setState(() => _nameQuery = value),
        totalCount: filtered.length,
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(distributionBoxFilterProvider.notifier).clear();
            ref.invalidate(distributionBoxProvider);
          },
          child: DistributionBoxList(boxes: filtered),
        ),
      ),
    );
  }
}

class _DistributionBoxLayout extends StatelessWidget {
  final String? nameQuery;
  final ValueChanged<String?> onNameQueryChanged;
  final int totalCount;
  final Widget body;

  const _DistributionBoxLayout({
    required this.nameQuery,
    required this.onNameQueryChanged,
    required this.totalCount,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DistributionBoxToolbar(
          nameQuery: nameQuery,
          totalCount: totalCount,
          onNameQueryChanged: onNameQueryChanged,
        ),
        DistributionBoxFilterChipsRow(
          nameQuery: nameQuery,
          onNameQueryChanged: onNameQueryChanged,
        ),
        Expanded(child: body),
      ],
    );
  }
}

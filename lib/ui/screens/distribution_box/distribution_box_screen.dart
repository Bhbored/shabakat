import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';

import 'widgets/distribution_box_filter_chips/distribution_box_filter_chips_row.dart';
import 'widgets/distribution_box_list/distribution_box_list.dart';
import 'widgets/distribution_box_toolbar/distribution_box_toolbar.dart';

class DistributionBoxScreen extends ConsumerWidget {
  const DistributionBoxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxesAsync = ref.watch(distributionBoxProvider);

    return boxesAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'Failed to load distribution boxes.',
        onTryAgain: () => ref.read(distributionBoxProvider.notifier).refresh(),
      ),
      data: (data) => _DistributionBoxLayout(
        totalCount: ref.read(distributionBoxProvider.notifier).getTotalCount(),
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(distributionBoxFilterProvider.notifier).clear();
            ref.invalidate(distributionBoxProvider);
          },
          child: DistributionBoxList(boxes: data),
        ),
      ),
    );
  }
}

class _DistributionBoxLayout extends StatelessWidget {
  final int totalCount;
  final Widget body;

  const _DistributionBoxLayout({required this.totalCount, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DistributionBoxToolbar(totalCount: totalCount),
        const DistributionBoxFilterChipsRow(),
        Expanded(child: body),
      ],
    );
  }
}

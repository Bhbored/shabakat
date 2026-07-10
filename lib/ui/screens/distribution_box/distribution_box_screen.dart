import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/distribution_boxes_skeleton.dart';

import 'widgets/distribution_box_filter_chips/distribution_box_filter_chips_row.dart';
import 'widgets/distribution_box_card/distribution_box_list.dart';
import 'widgets/distribution_box_toolbar/distribution_box_toolbar.dart';

class DistributionBoxScreen extends ConsumerStatefulWidget {
  const DistributionBoxScreen({super.key});

  @override
  ConsumerState<DistributionBoxScreen> createState() =>
      _DistributionBoxScreenState();
}

class _DistributionBoxScreenState extends ConsumerState<DistributionBoxScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        ref.read(distributionBoxFilterProvider.notifier).clear();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final boxesAsync = ref.watch(distributionBoxProvider);

    return boxesAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const DistributionBoxesSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException
            ? err.userMessage
            : 'distribution_boxes.load_failed'.tr(),
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

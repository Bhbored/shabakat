import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/distribution_boxes_skeleton.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        ref.read(distributionBoxFilterProvider.notifier).clear();
        // for (var distributionBox in DataSeeder.distributionBoxes()) {
        //   await ref
        //       .read(distributionBoxProvider.notifier)
        //       .createDistributionBox(distributionBox);
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final boxesAsync = ref.watch(distributionBoxProvider);
    final pagination = ref.watch(distributionBoxPaginationProvider);
    final filterNotifier = ref.read(distributionBoxFilterProvider.notifier);

    void goToPage(int page) {
      ref
          .read(distributionBoxFilterProvider.notifier)
          .update(
            ref.read(distributionBoxFilterProvider).copyWith(pageNumber: page),
          );
    }

    final totalCount = boxesAsync.hasValue
        ? ref.read(distributionBoxProvider.notifier).getTotalCount()
        : pagination.totalCount;

    return _DistributionBoxLayout(
      totalCount: totalCount,
      body: boxesAsync.when(
        skipLoadingOnRefresh: true,
        loading: () => _DistributionBoxesBodySkeleton(
          colorScheme: Theme.of(context).colorScheme,
        ),
        error: (err, _) => DynamicError(
          text: err is ApiException
              ? err.userMessage
              : 'distribution_boxes.load_failed'.tr(),
          onTryAgain: () =>
              ref.read(distributionBoxProvider.notifier).refresh(),
        ),
        data: (boxes) => RefreshIndicator(
          onRefresh: () async {
            ref.read(distributionBoxFilterProvider.notifier).clear();
            ref.invalidate(distributionBoxProvider);
          },
          child: DistributionBoxList(boxes: boxes),
        ),
      ),
      pagination: SubscribersPagination(
        currentPage: pagination.pageNumber,
        totalPages: pagination.totalPages,
        onPageChanged: goToPage,
        onFirstPage: filterNotifier.firstPage,
        onLastPage: filterNotifier.lastPage,
        isLoading: boxesAsync.isLoading,
      ),
    );
  }
}

class _DistributionBoxesBodySkeleton extends StatelessWidget {
  final ColorScheme colorScheme;

  const _DistributionBoxesBodySkeleton({required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: colorScheme.onSurface.withValues(alpha: 0.08),
          highlightColor: colorScheme.onSurface.withValues(alpha: 0.04),
        ),
        child: const DistributionBoxesListSkeleton(),
      ),
    );
  }
}

class _DistributionBoxLayout extends StatelessWidget {
  final int totalCount;
  final Widget body;
  final Widget? pagination;

  const _DistributionBoxLayout({
    required this.totalCount,
    required this.body,
    this.pagination,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DistributionBoxToolbar(totalCount: totalCount),
        const DistributionBoxFilterChipsRow(),
        Expanded(child: body),
        ?pagination,
      ],
    );
  }
}

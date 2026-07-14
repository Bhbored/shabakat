import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/ui/screens/distribution_box/widgets/distribution_box_card/distribution_box_list.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';

class AreaBoxesSection extends ConsumerWidget {
  final bool readOnly;

  const AreaBoxesSection({
    super.key,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final boxesAsync = ref.watch(distributionBoxProvider);
    final pagination = ref.watch(distributionBoxPaginationProvider);
    final filterNotifier = ref.read(distributionBoxFilterProvider.notifier);

    void goToPage(int page) {
      ref.read(distributionBoxFilterProvider.notifier).update(
            ref.read(distributionBoxFilterProvider).copyWith(pageNumber: page),
          );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            0,
            context.paddingMedium,
            context.spaceSmall,
          ),
          child: Text(
            'areas.details.boxes_section'.tr(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: boxesAsync.when(
            skipLoadingOnRefresh: true,
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) {
              if (err is ApiException) {
                return Center(
                  child: Text(err.userMessage, textAlign: TextAlign.center),
                );
              }
              return Center(
                child: Text('areas.details.load_boxes_failed'.tr()),
              );
            },
            data: (boxes) {
              if (boxes.isEmpty) {
                return Center(
                  child: Text(
                    'areas.details.no_boxes'.tr(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                );
              }
              return DistributionBoxList(boxes: boxes, readOnly: readOnly);
            },
          ),
        ),
        if (pagination.totalPages > 1)
          SubscribersPagination(
            currentPage: pagination.pageNumber,
            totalPages: pagination.totalPages,
            onPageChanged: goToPage,
            onFirstPage: filterNotifier.firstPage,
            onLastPage: filterNotifier.lastPage,
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';
import 'package:shabakat/data/providers/customer/customer_selection_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';

import '../../subscreens/subscribers_filters.dart';
import '../../subscreens/subscribers_search_screen.dart';
import '../subscriber_selection_actions/subscriber_selection_actions.dart';

class SubscribersToolbar extends ConsumerWidget {
  const SubscribersToolbar({super.key});

  String? _activeQuery(CustomerFilterRequest filter, List<Area>? areas) {
    if (filter.name != null) return filter.name;
    if (filter.phone != null) return filter.phone;
    if (filter.areaId != null) {
      for (final area in areas ?? const <Area>[]) {
        if (area.id == filter.areaId) return area.name;
      }
      return filter.areaId;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(customerPaginationProvider);
    final filter = ref.watch(customerFilterProvider);
    final selection = ref.watch(customerSelectionProvider);
    final areas = ref.watch(areaProvider).asData?.value;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final inputTheme = theme.inputDecorationTheme;
    final enabledBorder = inputTheme.enabledBorder;
    final borderRadius = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderRadius
        : BorderRadius.circular(context.borderRadiusMedium);
    final borderSide = enabledBorder is OutlineInputBorder
        ? enabledBorder.borderSide
        : BorderSide(color: colorScheme.outline);
    final activeQuery = _activeQuery(filter, areas);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      openInnerScreen(widget: const SubscribersSearchScreen()),
                    );
                  },
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: context.paddingSmall,
                  ),
                  minLeadingWidth: 28,
                  tileColor: inputTheme.fillColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius,
                    side: borderSide,
                  ),
                  leading: Icon(
                    Icons.search,
                    size: 20,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  title: Text(
                    activeQuery ?? 'Search customer',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: activeQuery != null
                          ? null
                          : colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(openInnerScreen(widget: const SubscribersFilters()));
                },
              ),
            ],
          ),
          SizedBox(height: context.spaceSmall),
          Row(
            children: [
              Expanded(
                child: Text(
                  selection.isSelectionMode
                      ? '${selection.selectedCustomerIds.length} selected'
                      : '${pagination.totalCount} subscribers',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
              const SubscriberSelectionActions(),
            ],
          ),
        ],
      ),
    );
  }
}

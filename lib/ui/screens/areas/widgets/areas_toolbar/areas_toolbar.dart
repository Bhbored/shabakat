import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class AreasToolbar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final int resultCount;
  final int totalCount;

  const AreasToolbar({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.resultCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: searchController,
            onChanged: onSearchChanged,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'areas.search_hint'.tr(),
              prefixIcon: const Icon(Icons.search, size: 20),
            ),
          ),
          SizedBox(height: context.spaceSmall),
          Text(
            resultCount == totalCount
                ? 'areas.count_all'.tr(args: [totalCount.toString()])
                : 'areas.count_filtered'.tr(
                    args: [resultCount.toString(), totalCount.toString()],
                  ),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

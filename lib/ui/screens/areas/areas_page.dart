import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/areas_skeleton.dart';

import 'widgets/area_list/area_list.dart';
import 'widgets/areas_toolbar/areas_toolbar.dart';

class AreasPage extends ConsumerStatefulWidget {
  const AreasPage({super.key});

  @override
  ConsumerState<AreasPage> createState() => _AreasPageState();
}

class _AreasPageState extends ConsumerState<AreasPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Area> _filterAreas(List<Area> areas) {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return areas;
    return areas
        .where((area) => area.name.toLowerCase().contains(query))
        .toList();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        ref.read(customerFilterProvider.notifier).clearFilter();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final areasAsync = ref.watch(areaProvider);
    final areas = areasAsync.asData?.value ?? [];
    final filtered = _filterAreas(areas);

    return areasAsync.when(
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
      loading: () => const AreasSkeleton(),
      error: (err, _) => _AreasLayout(
        searchController: _searchController,
        onSearchChanged: (_) => setState(() {}),
        resultCount: filtered.length,
        totalCount: areas.length,
        body: DynamicError(
          text: err is ApiException
              ? err.userMessage
              : 'areas.load_failed'.tr(),
          onTryAgain: () => ref.read(areaProvider.notifier).refresh(),
        ),
      ),
      data: (_) => _AreasLayout(
        searchController: _searchController,
        onSearchChanged: (_) => setState(() {}),
        resultCount: filtered.length,
        totalCount: areas.length,
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(areaProvider);
          },
          child: AreaList(areas: filtered),
        ),
      ),
    );
  }
}

class _AreasLayout extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final int resultCount;
  final int totalCount;
  final Widget body;

  const _AreasLayout({
    required this.searchController,
    required this.onSearchChanged,
    required this.resultCount,
    required this.totalCount,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AreasToolbar(
          searchController: searchController,
          onSearchChanged: onSearchChanged,
          resultCount: resultCount,
          totalCount: totalCount,
        ),
        SizedBox(height: context.spaceSmall),
        Expanded(child: body),
      ],
    );
  }
}

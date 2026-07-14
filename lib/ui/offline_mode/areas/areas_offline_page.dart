import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/areas/widgets/area_list/area_list.dart';
import 'package:shabakat/ui/screens/areas/widgets/areas_toolbar/areas_toolbar.dart';
import 'package:shabakat/ui/shared/error/dynamic_error.dart';
import 'package:shabakat/ui/shared/skeletons/areas_skeleton.dart';

class AreasOfflinePage extends ConsumerStatefulWidget {
  const AreasOfflinePage({super.key});

  @override
  ConsumerState<AreasOfflinePage> createState() => _AreasOfflinePageState();
}

class _AreasOfflinePageState extends ConsumerState<AreasOfflinePage> {
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
  Widget build(BuildContext context) {
    final areasAsync = ref.watch(areaProvider);
    final areas = areasAsync.asData?.value ?? [];
    final filtered = _filterAreas(areas);

    return areasAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const AreasSkeleton(),
      error: (err, _) => DynamicError(
        text: err is ApiException ? err.userMessage : 'areas.load_failed'.tr(),
        onTryAgain: () => ref.read(areaProvider.notifier).refresh(),
      ),
      data: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AreasToolbar(
            searchController: _searchController,
            onSearchChanged: (_) => setState(() {}),
            resultCount: filtered.length,
            totalCount: areas.length,
          ),
          SizedBox(height: context.spaceSmall),
          Expanded(
            child: AreaList(areas: filtered, readOnly: true),
          ),
        ],
      ),
    );
  }
}

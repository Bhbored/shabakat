import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import '../../subscribers/widgets/area_select/area_select_list.dart';

enum _SearchCriteria { name, area }

class DistributionBoxSearchScreen extends ConsumerStatefulWidget {
  const DistributionBoxSearchScreen({super.key});

  @override
  ConsumerState<DistributionBoxSearchScreen> createState() =>
      _DistributionBoxSearchScreenState();
}

class _DistributionBoxSearchScreenState
    extends ConsumerState<DistributionBoxSearchScreen> {
  final _searchController = TextEditingController();
  _SearchCriteria _criteria = _SearchCriteria.name;
  bool _initialized = false;
  String? _lastSyncedAreaId;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String? _areaNameForId(List<Area>? areas, String? areaId) {
    if (areaId == null || areas == null) return null;
    for (final area in areas) {
      if (area.id == areaId) return area.name;
    }
    return null;
  }

  void _syncAreaFieldText(List<Area>? areas) {
    if (_criteria != _SearchCriteria.area) return;

    final areaId = ref.read(distributionBoxFilterProvider).areaId;
    if (areaId == null) {
      _lastSyncedAreaId = null;
      return;
    }
    if (areaId == _lastSyncedAreaId) return;

    final name = _areaNameForId(areas, areaId);
    if (name == null) return;

    _searchController.text = name;
    _lastSyncedAreaId = areaId;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(distributionBoxFilterProvider);
    _criteria = _criteriaFromFilter(filter);
    if (_criteria == _SearchCriteria.area) {
      _syncAreaFieldText(ref.read(areaProvider).asData?.value);
    } else {
      _searchController.text = filter.name ?? '';
    }
    _initialized = true;
  }

  _SearchCriteria _criteriaFromFilter(DistributionBoxFilterRequest filter) {
    if (filter.areaId != null) return _SearchCriteria.area;
    return _SearchCriteria.name;
  }

  DistributionBoxFilterRequest _currentFilter() =>
      ref.read(distributionBoxFilterProvider);

  void _updateFilter(DistributionBoxFilterRequest filter) {
    ref.read(distributionBoxFilterProvider.notifier).update(filter);
  }

  void _applyNameSearch() {
    if (_criteria == _SearchCriteria.area) return;

    final q = _searchController.text.trim();
    final value = q.isEmpty ? null : q;

    _updateFilter(
      _currentFilter().copyWith(
        name: value,
        areaId: null,
        pageNumber: 1,
      ),
    );
    Navigator.of(context).pop();
  }

  void _selectArea(Area area) {
    _searchController.text = area.name;
    _lastSyncedAreaId = area.id;
    _updateFilter(
      _currentFilter().copyWith(
        name: null,
        areaId: area.id,
        pageNumber: 1,
      ),
    );
    Navigator.of(context).pop();
  }

  void _clearSearch() {
    _searchController.clear();
    _lastSyncedAreaId = null;
    final current = _currentFilter();

    _updateFilter(
      current.copyWith(
        name: _criteria == _SearchCriteria.name ? null : current.name,
        areaId: _criteria == _SearchCriteria.area ? null : current.areaId,
        pageNumber: 1,
      ),
    );
    setState(() {});
  }

  List<Area> _filterAreas(List<Area> areas) {
    final q = _searchController.text.trim().toLowerCase();
    if (q.isEmpty) return areas;
    return areas.where((a) => a.name.toLowerCase().contains(q)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isArea = _criteria == _SearchCriteria.area;
    final areasAsync = ref.watch(areaProvider);

    if (isArea) {
      _syncAreaFieldText(areasAsync.asData?.value);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Search boxes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    autofocus: true,
                    textInputAction:
                        isArea ? TextInputAction.done : TextInputAction.search,
                    onSubmitted: isArea ? null : (_) => _applyNameSearch(),
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: isArea
                          ? 'Search areas...'
                          : 'Search by box name...',
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search, size: 20),
                        onPressed: isArea ? null : _applyNameSearch,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: context.paddingSmall),
                IconButton(
                  onPressed:
                      _searchController.text.isEmpty ? null : _clearSearch,
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Wrap(
              spacing: context.paddingSmall,
              runSpacing: context.paddingSmall,
              children: [
                FilterChip(
                  label: const Text('Name'),
                  selected: _criteria == _SearchCriteria.name,
                  onSelected: (_) {
                    setState(() {
                      _criteria = _SearchCriteria.name;
                      _lastSyncedAreaId = null;
                      _searchController.text =
                          ref.read(distributionBoxFilterProvider).name ?? '';
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Area'),
                  selected: _criteria == _SearchCriteria.area,
                  onSelected: (_) {
                    setState(() {
                      _criteria = _SearchCriteria.area;
                      _syncAreaFieldText(
                        ref.read(areaProvider).asData?.value,
                      );
                    });
                  },
                ),
              ],
            ),
            if (isArea) ...[
              SizedBox(height: context.spaceMedium),
              Expanded(
                child: areasAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) {
                    final message = err is ApiException
                        ? err.userMessage
                        : 'Failed to load areas.';
                    return Center(
                      child: Text(message, textAlign: TextAlign.center),
                    );
                  },
                  data: (areas) => AreaSelectList(
                    areas: _filterAreas(areas),
                    onAreaSelected: _selectArea,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

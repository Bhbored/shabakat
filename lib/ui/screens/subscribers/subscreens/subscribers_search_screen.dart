import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import '../widgets/area_select/area_select_list.dart';

enum _SearchCriteria { name, area, phone }

class SubscribersSearchScreen extends ConsumerStatefulWidget {
  const SubscribersSearchScreen({super.key});

  @override
  ConsumerState<SubscribersSearchScreen> createState() =>
      _SubscribersSearchScreenState();
}

class _SubscribersSearchScreenState
    extends ConsumerState<SubscribersSearchScreen> {
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

  void _syncAreaFieldText() {
    if (_criteria != _SearchCriteria.area) return;

    final areaId = ref.read(customerFilterProvider).areaId;
    if (areaId == null) {
      _lastSyncedAreaId = null;
      return;
    }
    if (areaId == _lastSyncedAreaId) return;

    final name = _areaNameForId(ref.read(areaProvider).asData?.value, areaId);
    if (name == null) return;

    _searchController.text = name;
    _lastSyncedAreaId = areaId;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;

    final filter = ref.read(customerFilterProvider);
    _criteria = _criteriaFromFilter(filter);
    if (_criteria == _SearchCriteria.area) {
      _syncAreaFieldText();
    } else {
      _searchController.text = _queryFromFilter(filter, _criteria);
    }
    _initialized = true;
  }

  _SearchCriteria _criteriaFromFilter(CustomerFilterRequest filter) {
    if (filter.name != null) return _SearchCriteria.name;
    if (filter.areaId != null) return _SearchCriteria.area;
    if (filter.phone != null) return _SearchCriteria.phone;
    return _SearchCriteria.name;
  }

  String _queryFromFilter(CustomerFilterRequest filter, _SearchCriteria criteria) {
    return switch (criteria) {
      _SearchCriteria.name => filter.name ?? '',
      _SearchCriteria.phone => filter.phone ?? '',
      _SearchCriteria.area => '',
    };
  }

  CustomerFilterRequest _currentFilter() => ref.read(customerFilterProvider);

  void _updateFilter(CustomerFilterRequest filter) {
    ref.read(customerFilterProvider.notifier).updateFilter(filter);
  }

  void _applySearch() {
    if (_criteria == _SearchCriteria.area) return;

    final q = _searchController.text.trim();
    final value = q.isEmpty ? null : q;
    final current = _currentFilter();

    _updateFilter(
      current.copyWith(
        name: _criteria == _SearchCriteria.name ? value : null,
        phone: _criteria == _SearchCriteria.phone ? value : null,
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
        phone: null,
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
        phone: _criteria == _SearchCriteria.phone ? null : current.phone,
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

    if (isArea) {
      ref.listen(areaProvider, (_, _) {
        _syncAreaFieldText();
        if (mounted) setState(() {});
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('subscribers.search.title'.tr()),
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
                    textInputAction: isArea
                        ? TextInputAction.done
                        : TextInputAction.search,
                    onSubmitted: isArea ? null : (_) => _applySearch(),
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: isArea
                          ? 'subscribers.search.hint_areas'.tr()
                          : 'subscribers.search.hint_customer'.tr(),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search, size: 20),
                        onPressed: isArea ? null : _applySearch,
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
              children: _SearchCriteria.values.map((criteria) {
                final label = switch (criteria) {
                  _SearchCriteria.name => 'subscribers.search.criteria.name'.tr(),
                  _SearchCriteria.area => 'subscribers.search.criteria.area'.tr(),
                  _SearchCriteria.phone => 'subscribers.search.criteria.phone'.tr(),
                };
                return FilterChip(
                  label: Text(label),
                  selected: _criteria == criteria,
                  onSelected: (_) {
                    setState(() {
                      _criteria = criteria;
                      _lastSyncedAreaId = null;
                      if (criteria == _SearchCriteria.area) {
                        _syncAreaFieldText();
                      } else {
                        _searchController.text = _queryFromFilter(
                          ref.read(customerFilterProvider),
                          criteria,
                        );
                      }
                    });
                  },
                );
              }).toList(),
            ),
            if (isArea) ...[
              SizedBox(height: context.spaceMedium),
              Expanded(
                child: ref.watch(areaProvider).when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) {
                    final message = err is ApiException
                        ? err.userMessage
                        : 'areas.load_failed'.tr();
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

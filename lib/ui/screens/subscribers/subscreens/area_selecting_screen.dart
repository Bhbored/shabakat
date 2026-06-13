import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';

import '../widgets/area_select/area_select_list.dart';
import '../widgets/area_select/area_select_search_bar.dart';

class AreaSelectingScreen extends ConsumerStatefulWidget {
  const AreaSelectingScreen({super.key});

  @override
  ConsumerState<AreaSelectingScreen> createState() =>
      _AreaSelectingScreenState();
}

class _AreaSelectingScreenState extends ConsumerState<AreaSelectingScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Area> _filterAreas(List<Area> areas) {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return areas;
    return areas.where((a) => a.name.toLowerCase().contains(q)).toList();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final areasAsync = ref.watch(areaProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Select Area'),
      ),
      body: Column(
        children: [
          AreaSelectSearchBar(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
            onClear: _clearSearch,
          ),
          Expanded(
            child: areasAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                if (err is ApiException) {
                  return Center(
                    child: Text(err.userMessage, textAlign: TextAlign.center),
                  );
                }
                return Center(child: Text('Error loading areas: $err'));
              },
              data: (areas) => AreaSelectList(
                areas: _filterAreas(areas),
                onAreaSelected: (area) => Navigator.of(context).pop(area),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

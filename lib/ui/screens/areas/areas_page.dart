import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';

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

    return Column(
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
            data: (_) => AreaList(areas: filtered),
          ),
        ),
      ],
    );
  }
}

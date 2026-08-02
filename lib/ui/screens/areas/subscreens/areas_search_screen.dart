import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/areas/widgets/area_list/area_list.dart';

class AreasSearchScreen extends ConsumerStatefulWidget {
  final bool readOnly;

  const AreasSearchScreen({super.key, this.readOnly = false});

  @override
  ConsumerState<AreasSearchScreen> createState() => _AreasSearchScreenState();
}

class _AreasSearchScreenState extends ConsumerState<AreasSearchScreen> {
  final _searchController = TextEditingController();

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

  void _clearSearch() {
    _searchController.clear();
    setState(() {});
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
        title: Text('areas.search.title'.tr()),
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
                    textInputAction: TextInputAction.search,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'areas.search_hint'.tr(),
                      prefixIcon: const Icon(Icons.search, size: 20),
                    ),
                  ),
                ),
                SizedBox(width: context.paddingSmall),
                IconButton(
                  onPressed: _searchController.text.isEmpty
                      ? null
                      : _clearSearch,
                  icon: const Icon(Icons.clear),
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            Expanded(
              child: areasAsync.when(
                skipLoadingOnRefresh: true,
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
                data: (areas) => AreaList(
                  areas: _filterAreas(areas),
                  readOnly: widget.readOnly,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

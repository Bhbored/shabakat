import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/distribution_box_filter_request.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_pagination_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';

import '../widgets/area_select/area_select_search_bar.dart';

class BoxSelectingScreen extends ConsumerStatefulWidget {
  final String areaId;

  const BoxSelectingScreen({super.key, required this.areaId});

  @override
  ConsumerState<BoxSelectingScreen> createState() => _BoxSelectingScreenState();
}

class _BoxSelectingScreenState extends ConsumerState<BoxSelectingScreen> {
  final _searchController = TextEditingController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        _updateFilter(
          ref.read(distributionBoxFilterProvider).copyWith(
            areaId: widget.areaId,
            name: null,
            pageNumber: 1,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  DistributionBoxFilterRequest _currentFilter() =>
      ref.read(distributionBoxFilterProvider);

  void _updateFilter(DistributionBoxFilterRequest filter) {
    ref.read(distributionBoxFilterProvider.notifier).update(filter);
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;
      _updateFilter(
        _currentFilter().copyWith(
          name: value.trim().isEmpty ? null : value.trim(),
          pageNumber: 1,
        ),
      );
    });
  }

  void _clearSearch() {
    _searchDebounce?.cancel();
    _searchController.clear();
    _updateFilter(_currentFilter().copyWith(name: null, pageNumber: 1));
  }

  void _goToPage(int page) {
    _updateFilter(_currentFilter().copyWith(pageNumber: page));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final boxesAsync = ref.watch(distributionBoxProvider);
    final pagination = ref.watch(distributionBoxPaginationProvider);
    final filterNotifier = ref.read(distributionBoxFilterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('subscribers.box_select.title'.tr()),
      ),
      body: Column(
        children: [
          AreaSelectSearchBar(
            controller: _searchController,
            onChanged: _onSearchChanged,
            onClear: _clearSearch,
          ),
          Expanded(
            child: boxesAsync.when(
              skipLoadingOnRefresh: true,
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) {
                final message = err is ApiException
                    ? err.userMessage
                    : 'subscribers.box_select.load_failed'.tr();
                return Center(
                  child: Text(message, textAlign: TextAlign.center),
                );
              },
              data: (boxes) {
                if (boxes.isEmpty) {
                  return Center(
                    child: Text(
                      'subscribers.box_select.empty'.tr(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(child: _BoxList(boxes: boxes)),
                    if (pagination.totalPages > 1)
                      SubscribersPagination(
                        currentPage: pagination.pageNumber,
                        totalPages: pagination.totalPages,
                        onPageChanged: _goToPage,
                        onFirstPage: filterNotifier.firstPage,
                        onLastPage: filterNotifier.lastPage,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BoxList extends StatelessWidget {
  final List<DistributionBox> boxes;

  const _BoxList({required this.boxes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: boxes.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final box = boxes[index];
        return ListTile(
          title: Text(
            box.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: box.locationNote == null
              ? null
              : Text(
                  box.locationNote!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
          onTap: () => Navigator.of(context).pop(box),
        );
      },
    );
  }
}

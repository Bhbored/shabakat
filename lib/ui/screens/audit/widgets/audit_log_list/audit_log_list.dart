import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/data/providers/audit/audit_log_filter_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_pagination_provider.dart';
import 'package:shabakat/data/providers/audit/audit_log_provider.dart';
import 'package:shabakat/domain/entities/audit/audit_log.dart';

import '../audit_log_card/audit_log_card.dart';
import 'audit_log_skeleton_cards.dart';

class AuditLogList extends ConsumerStatefulWidget {
  final List<AuditLog> logs;

  const AuditLogList({super.key, required this.logs});

  @override
  ConsumerState<AuditLogList> createState() => _AuditLogListState();
}

class _AuditLogListState extends ConsumerState<AuditLogList> {
  final ScrollController _scrollController = ScrollController();

  static const _loadMoreThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _tryLoadMore());
  }

  @override
  void didUpdateWidget(covariant AuditLogList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logs.length != oldWidget.logs.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _tryLoadMore());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() => _tryLoadMore();

  void _tryLoadMore() {
    if (!_scrollController.hasClients) return;

    final pagination = ref.read(auditLogPaginationProvider);
    if (!pagination.hasNextPage || pagination.isLoadingMore) return;

    final position = _scrollController.position;
    final nearBottom =
        position.pixels >= position.maxScrollExtent - _loadMoreThreshold;
    final contentFitsOnScreen = position.maxScrollExtent <= _loadMoreThreshold;

    if (!nearBottom && !contentFitsOnScreen) return;

    ref.read(auditLogProvider.notifier).loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final pagination = ref.watch(auditLogPaginationProvider);
    final showFooterSkeleton =
        pagination.isLoadingMore && pagination.hasNextPage;

    ref.listen(auditLogFilterProvider, (previous, next) {
      if (previous == null || previous == next) return;
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });

    if (widget.logs.isEmpty) {
      final theme = Theme.of(context);
      return ListView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(height: context.screenHeight * 0.2),
          Center(
            child: Text(
              'No activity recorded yet.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      );
    }

    final itemCount = widget.logs.length + (showFooterSkeleton ? 1 : 0);

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(
        context.paddingMedium,
        0,
        context.paddingMedium,
        context.viewInsets.bottom,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (index >= widget.logs.length) {
          return const AuditLogSkeletonCards(itemCount: 2, clipLastItem: true);
        }

        return Padding(
          padding: EdgeInsets.only(bottom: context.spaceSmall),
          child: AuditLogCard(log: widget.logs[index]),
        );
      },
    );
  }
}

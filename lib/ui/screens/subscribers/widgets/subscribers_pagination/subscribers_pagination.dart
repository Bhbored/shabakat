import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class SubscribersPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final VoidCallback? onFirstPage;
  final VoidCallback? onLastPage;

  const SubscribersPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.onFirstPage,
    this.onLastPage,
  });

  List<_PageItem> _pageItems() {
    if (totalPages <= 5) {
      return List.generate(totalPages, (index) => _PageItem.page(index + 1));
    }

    final items = <_PageItem>[_PageItem.page(1)];

    if (currentPage > 3) {
      items.add(const _PageItem.ellipsis());
    }

    final start = currentPage <= 3 ? 2 : currentPage - 1;
    final end = currentPage >= totalPages - 2
        ? totalPages - 1
        : currentPage + 1;

    for (var page = start; page <= end; page++) {
      if (page > 1 && page < totalPages) {
        items.add(_PageItem.page(page));
      }
    }

    if (currentPage < totalPages - 2) {
      items.add(const _PageItem.ellipsis());
    }

    if (totalPages > 1) {
      items.add(_PageItem.page(totalPages));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: colorScheme.outline)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          context.paddingMedium,
          context.paddingSmall * 0.5,
          context.paddingMedium,
          context.paddingSmall * 0.5 + context.bottomPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (onFirstPage != null) ...[
              _NavButton(
                icon: Icons.first_page,
                enabled: currentPage > 1,
                onPressed: onFirstPage!,
              ),
              SizedBox(width: context.paddingSmall * 0.5),
            ],
            _NavButton(
              icon: Icons.chevron_left,
              enabled: currentPage > 1,
              onPressed: () => onPageChanged(currentPage - 1),
            ),
            SizedBox(width: context.paddingSmall * 0.5),
            ..._pageItems().map((item) {
              return switch (item) {
                _PageNumber(:final page) => _PageButton(
                  page: page,
                  isSelected: page == currentPage,
                  onPressed: () => onPageChanged(page),
                ),
                _PageEllipsis() => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.paddingSmall * 0.5,
                  ),
                  child: Text(
                    '…',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              };
            }),
            SizedBox(width: context.paddingSmall * 0.5),
            _NavButton(
              icon: Icons.chevron_right,
              enabled: currentPage < totalPages,
              onPressed: () => onPageChanged(currentPage + 1),
            ),
            if (onLastPage != null) ...[
              SizedBox(width: context.paddingSmall * 0.5),
              _NavButton(
                icon: Icons.last_page,
                enabled: currentPage < totalPages,
                onPressed: onLastPage!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

sealed class _PageItem {
  const _PageItem();

  const factory _PageItem.page(int page) = _PageNumber;
  const factory _PageItem.ellipsis() = _PageEllipsis;
}

final class _PageNumber extends _PageItem {
  final int page;

  const _PageNumber(this.page);
}

final class _PageEllipsis extends _PageItem {
  const _PageEllipsis();
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;

  const _NavButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, size: 18),
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      padding: EdgeInsets.zero,
      style: IconButton.styleFrom(
        backgroundColor: colorScheme.surfaceContainerHighest,
        foregroundColor: colorScheme.onSurface,
        disabledBackgroundColor: colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        ),
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onPressed;

  const _PageButton({
    required this.page,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.paddingSmall * 0.25),
      child: Material(
        color: isSelected
            ? colorScheme.primary
            : colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        ),
        child: InkWell(
          onTap: isSelected ? null : onPressed,
          borderRadius: BorderRadius.circular(context.borderRadiusMedium),
          child: SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: Text(
                '$page',
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

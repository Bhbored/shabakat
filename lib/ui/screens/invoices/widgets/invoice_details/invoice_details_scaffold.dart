import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class InvoiceDetailsScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onShare;
  final bool isShareLoading;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const InvoiceDetailsScaffold({
    super.key,
    required this.title,
    required this.body,
    this.onShare,
    this.isShareLoading = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.x),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (onShare != null)
            IconButton(
              onPressed: isShareLoading ? null : onShare,
              icon: isShareLoading
                  ? SizedBox(
                      width: theme.iconTheme.size,
                      height: theme.iconTheme.size,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(LucideIcons.share2),
            ),
          if (onEdit != null)
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
          if (onDelete != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onDelete,
            ),
        ],
      ),
      body: body,
    );
  }
}

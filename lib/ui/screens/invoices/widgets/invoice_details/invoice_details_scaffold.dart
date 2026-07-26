import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/themes/app_colors.dart';

class InvoiceDetailsScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onShare;
  final bool isShareLoading;
  final VoidCallback? onWhatsAppShare;
  final bool isWhatsAppShareLoading;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const InvoiceDetailsScaffold({
    super.key,
    required this.title,
    required this.body,
    this.onShare,
    this.isShareLoading = false,
    this.onWhatsAppShare,
    this.isWhatsAppShareLoading = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSize = theme.iconTheme.size;
    final actionsBusy = isShareLoading || isWhatsAppShareLoading;

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
          if (onWhatsAppShare != null)
            IconButton(
              onPressed: actionsBusy ? null : onWhatsAppShare,
              icon: isWhatsAppShareLoading
                  ? SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    )
                  : FaIcon(
                      FontAwesomeIcons.whatsapp,
                      color: AppColors.whatsApp,
                      size: iconSize,
                    ),
            ),
          if (onShare != null)
            IconButton(
              onPressed: actionsBusy ? null : onShare,
              icon: isShareLoading
                  ? SizedBox(
                      width: iconSize,
                      height: iconSize,
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

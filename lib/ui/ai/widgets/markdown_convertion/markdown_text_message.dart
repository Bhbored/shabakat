import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class MarkdownTextMessage extends StatelessWidget {
  const MarkdownTextMessage({
    super.key,
    required this.message,
    required this.isSentByMe,
    required this.isStreaming,
  });

  final TextMessage message;
  final bool isSentByMe;
  final bool isStreaming;

  static final _rtlScript = RegExp(
    r'[\u0590-\u05FF\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF'
    r'\uFB50-\uFDFF\uFE70-\uFEFF]',
  );

  TextDirection _textDirection(BuildContext context) {
    final text = message.text.trim();
    if (text.isEmpty) return Directionality.of(context);
    return _rtlScript.hasMatch(text) ? TextDirection.rtl : TextDirection.ltr;
  }

  TextStyle? _withHeight(TextStyle? style, Color color) {
    return style?.copyWith(color: color, height: 1.4);
  }

  MarkdownStyleSheet _styleSheet(
    BuildContext context, {
    required Color foreground,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final base = _withHeight(theme.textTheme.bodyMedium, foreground);
    final sectionGap = EdgeInsets.only(bottom: context.spaceSmall);

    return MarkdownStyleSheet.fromTheme(theme).copyWith(
      blockSpacing: context.spaceSmall,
      p: base,
      pPadding: sectionGap,
      h1: _withHeight(theme.textTheme.titleLarge, foreground)?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      h1Padding: sectionGap,
      h2: _withHeight(theme.textTheme.titleMedium, foreground)?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      h2Padding: sectionGap,
      h3: _withHeight(theme.textTheme.titleSmall, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h3Padding: sectionGap,
      h4: _withHeight(theme.textTheme.bodyLarge, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h4Padding: sectionGap,
      h5: _withHeight(theme.textTheme.bodyMedium, foreground)?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      h5Padding: sectionGap,
      h6: _withHeight(theme.textTheme.bodyMedium, foreground),
      h6Padding: sectionGap,
      strong: base?.copyWith(fontWeight: FontWeight.bold),
      em: base?.copyWith(fontStyle: FontStyle.italic),
      del: base?.copyWith(decoration: TextDecoration.lineThrough),
      listBullet: base,
      listIndent: context.paddingMedium * 1.5,
      tableBody: base,
      tableHead: base?.copyWith(fontWeight: FontWeight.w600),
      tableColumnWidth: const IntrinsicColumnWidth(),
      tableCellsPadding: EdgeInsets.symmetric(
        horizontal: context.paddingSmall,
        vertical: context.spaceSmall / 2,
      ),
      tableBorder: TableBorder.all(
        color: foreground.withValues(alpha: 0.25),
      ),
      blockquote: base?.copyWith(
        color: foreground.withValues(alpha: 0.85),
      ),
      a: base?.copyWith(
        color: isSentByMe ? colorScheme.onPrimary : colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      code: theme.textTheme.bodySmall?.copyWith(
        fontFamily: 'monospace',
        color: foreground,
        height: 1.4,
        backgroundColor: colorScheme.surface.withValues(alpha: 0.28),
      ),
      codeblockDecoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      ),
      blockquoteDecoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium / 2),
        border: BorderDirectional(
          start: BorderSide(color: colorScheme.primary, width: 3),
        ),
      ),
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: foreground.withValues(alpha: 0.25),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textDirection = _textDirection(context);
    final backgroundColor = isSentByMe
        ? colorScheme.primary
        : colorScheme.surfaceContainerHighest;
    final foreground = isSentByMe
        ? colorScheme.onPrimary
        : colorScheme.onSurface;

    return ClipRRect(
      borderRadius: BorderRadius.circular(context.borderRadiusMedium),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.screenWidth * 0.82),
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingMedium,
          vertical: context.paddingSmall,
        ),
        child: isStreaming
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foreground,
                ),
              )
            : Directionality(
                textDirection: textDirection,
                child: MarkdownBody(
                  data: message.text,
                  shrinkWrap: true,
                  fitContent: true,
                  styleSheet: _styleSheet(context, foreground: foreground),
                ),
              ),
      ),
    );
  }
}

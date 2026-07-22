import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/services/ai/ai_service.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
import 'package:uuid/uuid.dart';

class AiChatScreen extends ConsumerStatefulWidget {
  const AiChatScreen({super.key});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  static const _userId = 'user';
  static const _assistantId = 'assistant';

  final _chatController = InMemoryChatController();
  final _uuid = const Uuid();
  CancelToken? _cancelToken;
  var _isStreaming = false;

  @override
  void dispose() {
    _cancelToken?.cancel();
    _chatController.dispose();
    super.dispose();
  }

  Future<void> _onMessageSend(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty || _isStreaming) return;

    setState(() => _isStreaming = true);
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    await _chatController.insertMessage(
      TextMessage(
        id: _uuid.v4(),
        authorId: _userId,
        createdAt: DateTime.now().toUtc(),
        text: trimmed,
      ),
    );

    var assistantMessage = TextMessage(
      id: _uuid.v4(),
      authorId: _assistantId,
      createdAt: DateTime.now().toUtc(),
      text: '',
    );
    await _chatController.insertMessage(assistantMessage);

    var accumulated = '';
    try {
      await for (final chunk in ref.read(aiServiceProvider).streamChat(
        prompt: trimmed,
        cancelToken: _cancelToken,
      )) {
        if (!mounted) return;
        accumulated += chunk;
        final updated = assistantMessage.copyWith(text: accumulated);
        await _chatController.updateMessage(assistantMessage, updated);
        assistantMessage = updated;
      }
    } catch (e) {
      if (!mounted) return;
      final cancelled =
          (e is DioException && CancelToken.isCancel(e)) ||
          (e is ApiException &&
              e.originalError is DioException &&
              CancelToken.isCancel(e.originalError as DioException));
      if (!cancelled) {
        AppSnackBar.show(
          context,
          message: e is ApiException ? e.userMessage : 'ai.error'.tr(),
          variant: AppSnackBarVariant.error,
        );
      }
    } finally {
      _cancelToken = null;
      if (mounted) setState(() => _isStreaming = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ai.title'.tr(),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSecondary,
          ),
        ),
      ),
      body: Chat(
        chatController: _chatController,
        currentUserId: _userId,
        theme: ChatTheme.fromThemeData(theme),
        onMessageSend: _isStreaming ? null : _onMessageSend,
        resolveUser: (id) async {
          if (id == _assistantId) {
            return User(id: id, name: 'ai.assistant_name'.tr());
          }
          return User(id: id, name: 'ai.you'.tr());
        },
        builders: Builders(
          textMessageBuilder:
              (context, message, index, {required isSentByMe, groupStatus}) {
                return _MarkdownTextMessage(
                  message: message,
                  isSentByMe: isSentByMe,
                  isStreaming: _isStreaming &&
                      message.authorId == _assistantId &&
                      message.text.isEmpty,
                );
              },
          composerBuilder: (context) => Composer(
            hintText: 'ai.hint'.tr(),
            sendButtonDisabled: _isStreaming,
            sendIcon: _isStreaming
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  )
                : const Icon(Icons.send),
          ),
          emptyChatListBuilder: (context) => Center(
            child: Padding(
              padding: EdgeInsets.all(context.paddingLarge),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    LucideIcons.bot,
                    size: 48,
                    color: colorScheme.onSurface.withValues(alpha: 0.35),
                  ),
                  SizedBox(height: context.spaceMedium),
                  Text(
                    'ai.empty'.tr(),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MarkdownTextMessage extends StatelessWidget {
  const _MarkdownTextMessage({
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

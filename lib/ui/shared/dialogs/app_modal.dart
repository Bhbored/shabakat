import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

Future<T?> showAppDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: builder,
  );
}

class AppAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;

  const AppAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.actionsPadding,
    this.contentPadding,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shape,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: title,
      content: content,
      actions: actions,
      actionsPadding: actionsPadding,
      contentPadding: contentPadding,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      shape: shape,
      alignment: alignment,
    );
  }
}

class AppDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? insetPadding;
  final double? maxWidth;

  const AppDialog({
    super.key,
    required this.child,
    this.insetPadding,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: insetPadding ??
          EdgeInsets.symmetric(
            horizontal: context.paddingMedium,
            vertical: context.spaceLarge,
          ),
      child: SingleChildScrollView(
        child: maxWidth != null
            ? ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth!),
                child: child,
              )
            : child,
      ),
    );
  }
}

Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: false,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: (sheetContext) {
      final keyboardInset = MediaQuery.viewInsetsOf(sheetContext).bottom;

      return Padding(
        padding: EdgeInsets.only(bottom: keyboardInset),
        child: SingleChildScrollView(
          child: builder(sheetContext),
        ),
      );
    },
  );
}

Future<T?> showAppFormBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: false,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    builder: (sheetContext) {
      final keyboardInset = MediaQuery.viewInsetsOf(sheetContext).bottom;

      return Padding(
        padding: EdgeInsets.only(bottom: keyboardInset),
        child: builder(sheetContext),
      );
    },
  );
}

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget> actions;
  final bool isBusy;

  const AppBottomSheet({
    super.key,
    required this.title,
    required this.body,
    required this.actions,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            context.paddingSmall,
            context.paddingSmall,
            context.paddingSmall,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: isBusy ? null : () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Padding(
          padding: EdgeInsets.all(context.paddingMedium),
          child: body,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            context.paddingMedium,
            0,
            context.paddingMedium,
            context.paddingMedium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: actions,
          ),
        ),
      ],
    );
  }
}

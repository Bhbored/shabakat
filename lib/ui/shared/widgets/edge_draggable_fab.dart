import 'package:flutter/material.dart';
import 'package:shabakat/core/constants/app_sizes.dart';

class EdgeDraggableFab extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String? tooltip;
  final double bottomInset;

  const EdgeDraggableFab({
    super.key,
    required this.onPressed,
    required this.child,
    this.tooltip,
    this.bottomInset = 0,
  });

  @override
  State<EdgeDraggableFab> createState() => _EdgeDraggableFabState();
}

class _EdgeDraggableFabState extends State<EdgeDraggableFab>
    with SingleTickerProviderStateMixin {
  static const _fabSize = 56.0;

  Offset? _offset;
  late final AnimationController _snapController;
  Animation<Offset>? _snapAnimation;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    )..addListener(() {
        final animation = _snapAnimation;
        if (animation == null) return;
        setState(() => _offset = animation.value);
      });
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  Offset _defaultOffset(Size area) {
    final padding = context.paddingMedium;
    return Offset(
      area.width - _fabSize - padding,
      area.height - _fabSize - widget.bottomInset - padding,
    );
  }

  Offset _clamp(Offset offset, Size area) {
    final padding = context.paddingMedium;
    final maxX = (area.width - _fabSize - padding).clamp(0.0, double.infinity);
    final maxY = (area.height - _fabSize - widget.bottomInset - padding).clamp(
      0.0,
      double.infinity,
    );
    return Offset(
      offset.dx.clamp(padding, maxX),
      offset.dy.clamp(padding, maxY),
    );
  }

  Offset _snapToEdge(Offset offset, Size area) {
    final padding = context.paddingMedium;
    final centerX = offset.dx + _fabSize / 2;
    final left = padding;
    final right = area.width - _fabSize - padding;
    final x = centerX < area.width / 2 ? left : right;
    return _clamp(Offset(x, offset.dy), area);
  }

  void _animateTo(Offset target) {
    final current = _offset;
    if (current == null) return;
    _snapAnimation = Tween<Offset>(begin: current, end: target).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.easeOutCubic),
    );
    _snapController
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final area = Size(constraints.maxWidth, constraints.maxHeight);
        _offset ??= _defaultOffset(area);
        final offset = _clamp(_offset!, area);

        return Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: GestureDetector(
                onPanStart: (_) => _snapController.stop(),
                onPanUpdate: (details) {
                  setState(() {
                    _offset = _clamp(
                      (_offset ?? offset) + details.delta,
                      area,
                    );
                  });
                },
                onPanEnd: (_) {
                  final snapped = _snapToEdge(_offset ?? offset, area);
                  _animateTo(snapped);
                },
                child: FloatingActionButton(
                  onPressed: widget.onPressed,
                  tooltip: widget.tooltip,
                  child: widget.child,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

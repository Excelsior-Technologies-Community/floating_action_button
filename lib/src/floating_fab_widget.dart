import 'package:flutter/material.dart';
import 'fab_item.dart';
import 'fab_controller.dart';
import 'fab_style.dart';

class FloatingActionExpandableFab extends StatefulWidget {
  final List<FabItem> items;
  final FabStyle style;
  final IconData icon;

  const FloatingActionExpandableFab({
    super.key,
    required this.items,
    this.icon = Icons.add,
    this.style = const FabStyle(),
  });

  @override
  State<FloatingActionExpandableFab> createState() =>
      _FloatingActionExpandableFabState();
}

class _FloatingActionExpandableFabState
    extends State<FloatingActionExpandableFab>
    with SingleTickerProviderStateMixin {

  final FabController _controller = FabController();
  OverlayEntry? _overlayEntry;
  late AnimationController _animation;

  static const double _fabSize = 56;
  static const double _miniSize = 48;
  static const double _spacing = 72;

  @override
  void initState() {
    super.initState();

    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );
  }

  void _toggleMenu() {
    if (_controller.isOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _openMenu() {
    _controller.open();
    _animation.forward();

    _overlayEntry = _createOverlay();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeMenu() {
    _animation.reverse();
    _controller.close();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlay() {

    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset fabPosition = box.localToGlobal(Offset.zero);

    final Size screen = MediaQuery.of(context).size;

    /// detect opening direction automatically
    final bool openUpward = fabPosition.dy > screen.height / 2;

    /// center of main FAB
    final double centerX = fabPosition.dx + (_fabSize / 2);
    final double centerY = fabPosition.dy + (_fabSize / 2);

    return OverlayEntry(
      builder: (context) {
        return Stack(
          children: [

            /// Background overlay
            GestureDetector(
              onTap: _closeMenu,
              child: Container(color: Colors.black45),
            ),

            /// Mini action buttons
            ...List.generate(widget.items.length, (i) {

              final item = widget.items[i];

              return AnimatedBuilder(
                animation: _animation,
                builder: (_, __) {

                  final double progress =
                  Curves.easeOut.transform(_animation.value);

                  final double offsetY = (i + 1) * _spacing * progress;

                  final double calculatedTop = openUpward
                      ? centerY - offsetY - (_miniSize / 2)   // open UP
                      : centerY + offsetY - (_miniSize / 2);  // open DOWN

                  final double calculatedLeft =
                  (centerX - (_miniSize / 2))
                      .clamp(16.0, screen.width - _miniSize - 16.0);

                  return Positioned(
                    left: calculatedLeft,
                    top: calculatedTop,
                    child: Opacity(
                      opacity: progress,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          /// LABEL (only if enabled)
                          if (widget.style.showLabels && item.label != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Material(
                                color: Colors.black87,
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  child: Text(
                                    item.label!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          /// MINI FAB
                          FloatingActionButton(
                            heroTag: "mini_$i",
                            mini: true,
                            elevation: 6,
                            backgroundColor:
                            item.backgroundColor ??
                                widget.style.backgroundColor,
                            onPressed: () {
                              _closeMenu();
                              item.onTap();
                            },
                            child: Icon(
                              item.icon,
                              color: item.iconColor ??
                                  widget.style.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "mainFab",
      elevation: 8,
      backgroundColor: widget.style.backgroundColor,
      onPressed: _toggleMenu,
      child: AnimatedRotation(
        duration: const Duration(milliseconds: 280),
        turns: _controller.isOpen ? 0.125 : 0,
        child: Icon(widget.icon, color: widget.style.iconColor),
      ),
    );
  }
}

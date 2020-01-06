import 'package:flutter/material.dart';

///挤压效果Card
class PressableCard extends StatefulWidget {
  PressableCard(
      {Key key,
      @required this.onPressed,
      @required this.flattenAnimation,
      this.elevation = 0.0,
      this.borderRadius,
      this.color = Colors.transparent,
      this.child})
      : assert(child != null, borderRadius != null),
        super(key: key);
  final VoidCallback onPressed;
  final Color color;
  final double elevation;
  final BorderRadius borderRadius;
  final Animation<double> flattenAnimation;
  final Widget child;

  @override
  State createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard>
    with SingleTickerProviderStateMixin {
  bool pressed = false;
  AnimationController controller;
  Animation<double> elevationAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 40),
    );
    elevationAnimation =
        controller.drive(CurveTween(curve: Curves.easeInOutCubic));
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (details) {
        if (widget.onPressed != null) {
          controller.forward();
        }
      },
      onPointerUp: (details) {
        controller.reverse();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed();
          }
        },
        child: AnimatedBuilder(
          animation: Listenable.merge([
            elevationAnimation,
            widget.flattenAnimation ?? AlwaysStoppedAnimation(0)
          ]),
          child: widget.child,
          builder: (context, child) {
            return Transform.scale(
              scale: 1 - elevationAnimation.value * 0.03,
              child: PhysicalModel(
                elevation: widget.elevation,
                borderRadius: widget.borderRadius,
                clipBehavior: Clip.antiAlias,
                color: widget.color,
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}

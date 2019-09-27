import 'package:flutter/material.dart';
import '../shape_of_view.dart';

enum ArcCirclePosition { Bottom, Top, Left, Right }

class ArcCircleShape extends Shape {
  final ArcCirclePosition position;
  final double offset;

  ArcCircleShape({
    this.position = ArcCirclePosition.Bottom,
    this.offset = 0,
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect, scale);
  }

  Path generatePath(Rect rect, double scale) {
    final size = rect.size;
    switch (this.position) {
      case ArcCirclePosition.Top:
        final Offset offsetCenter =
        Offset(size.width / 2, size.height/2-offset);
        final Rect arcRect =
        Rect.fromCircle(center: offsetCenter, radius: size.height / 2);
        return Path()
          ..addArc(arcRect, 0, 180)
          ..close();
        break;
      case ArcCirclePosition.Bottom:
        final Offset offsetCenter =
        Offset(size.width / 2, size.height/2+offset);
        final Rect arcRect =
        Rect.fromCircle(center: offsetCenter, radius: size.height / 2);
        return Path()
          ..addArc(arcRect, 0, 180)
          ..close();
        break;
      case ArcCirclePosition.Left:
        final Offset offsetCenter =
            Offset(size.width / 2-offset, size.height/2);
        final Rect arcRect =
            Rect.fromCircle(center: offsetCenter, radius: size.height / 2);
        return Path()
          ..addArc(arcRect, 0, 180)
          ..close();
        break;
      default: //right
        final Offset offsetCenter =
        Offset(size.width / 2+offset, size.height/2);
        final Rect arcRect =
        Rect.fromCircle(center: offsetCenter, radius: size.height / 2);
        return Path()
          ..addArc(arcRect, 0, 180)
          ..close();
        break;
    }
  }
}

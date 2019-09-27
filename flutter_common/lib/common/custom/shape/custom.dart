import 'package:flutter/material.dart';

import '../shape_of_view.dart';

typedef ShapeBuilder = Path Function(Rect rect);

class CustomShape extends Shape {
  final ShapeBuilder builder;

  CustomShape({
    this.builder,
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({Rect rect}) {
    return this.builder(rect);
  }
}

import 'package:flutter/material.dart';

class AnimatedSequencePage extends StatefulWidget {
  @override
  State createState() => _AnimatedSequencePageState();
}

class _AnimatedSequencePageState extends State<AnimatedSequencePage>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(seconds: 3);
  AnimationController controller;
  Animation<Color> animation;

  static final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  void initState() {
    super.initState();
    final sequenceItems = <TweenSequenceItem<Color>>[];

    for (var i = 0; i < colors.length; i++) {
      final beginColor = colors[i];
      final endColor = colors[(i + 1) % colors.length];
      final weight = 1 / colors.length;

      sequenceItems.add(
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: beginColor, end: endColor),
          weight: weight,
        ),
      );
    }
    controller = AnimationController(vsync: this, duration: duration);
    animation = TweenSequence(sequenceItems).animate(controller);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return MaterialButton(
                color: animation.value,
                child: child,
                onPressed: () async {
                  await controller.forward();
                  controller.reset();
                });
          },
          child: Text(
            'Change Color',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

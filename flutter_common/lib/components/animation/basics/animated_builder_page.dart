import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  State createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  static const Color beginColor = Colors.deepPurple;
  static const Color endColor = Colors.deepOrange;
  Duration duration = Duration(milliseconds: 800);
  AnimationController controller;
  Animation<Color> animation;

  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
    animation =
        ColorTween(begin: beginColor, end: endColor).animate(controller);
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
                onPressed: () {
                  if (controller.status == AnimationStatus.completed) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
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

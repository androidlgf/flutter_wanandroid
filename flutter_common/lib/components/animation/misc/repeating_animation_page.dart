import 'package:flutter/material.dart';

class RepeatingAnimationPage extends StatefulWidget {
  @override
  State createState() => _RepeatingAnimationPageState();
}

class _RepeatingAnimationPageState extends State<RepeatingAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<BorderRadius> _borderRadius;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    _borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(100.0),
            end: BorderRadius.circular(0.0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = AnimatedBuilder(
        animation: _borderRadius,
        builder: (ctx, child) {
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.blueAccent, borderRadius: _borderRadius.value),
          );
        });
    return Scaffold(
      appBar: AppBar(
        title: Text('RepeatingAnimation'),
      ),
      body: Center(
        child: bodyWidget,
      ),
    );
  }
}

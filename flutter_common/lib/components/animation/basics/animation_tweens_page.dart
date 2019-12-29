import 'package:flutter/material.dart';

class AnimationTweenPage extends StatefulWidget {
  @override
  State createState() => _AnimationTweenPageState();
}

class _AnimationTweenPageState extends State<AnimationTweenPage>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 1);
  AnimationController _controller;
  static const double accountBalance = 1000000;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 0.0, end: accountBalance).animate(_controller);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text('${animation.value.toStringAsFixed(2)}'),
            ),
            RaisedButton(
              child: Text('animate'),
              onPressed: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

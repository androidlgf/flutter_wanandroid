import 'package:flutter/material.dart';

class AnimationControllerPage extends StatefulWidget {
  @override
  State createState() => _AnimationControllerPageState();
}

class _AnimationControllerPageState extends State<AnimationControllerPage>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 1);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {});
      });
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
              child: Text('${_controller.value.toStringAsFixed(2)}',
                  textScaleFactor: 1 + _controller.value),
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

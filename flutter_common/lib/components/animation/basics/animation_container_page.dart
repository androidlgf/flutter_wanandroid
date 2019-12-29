import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double generateBorderRadius() => Random().nextDouble() * 64;

double generateMargin() => Random().nextDouble() * 64;

Color generateColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

class AnimationContainerPage extends StatefulWidget {
  @override
  State createState() => _AnimationContainerPageState();
}

class _AnimationContainerPageState extends State<AnimationContainerPage> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateBorderRadius();
    margin = generateMargin();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget=Container();

    return Scaffold(
      appBar: AppBar(title: Text('AnimationContainer')),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                    width: 128,
                    height: 128,
                    child: AnimatedContainer(
                        margin: EdgeInsets.all(margin),
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(borderRadius)),
                        duration: const Duration(milliseconds: 1400)))),
            RaisedButton(
                onPressed: () {
                  color = generateColor();
                  margin = generateMargin();
                  borderRadius = generateBorderRadius();
                  setState(() {});
                },
                child: Text('change'))
          ],
        ),
      ),
    );
  }
}

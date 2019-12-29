import 'package:flutter/material.dart';

class ExpandCardPage extends StatefulWidget {
  @override
  State createState() => _ExpandCardPageState();
}

class _ExpandCardPageState extends State<ExpandCardPage>
    with SingleTickerProviderStateMixin {
  static const Duration duration = Duration(milliseconds: 300);
  bool selected = false;

  double get size => selected ? 256 : 128;

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget = Material(
      child: InkWell(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AnimatedContainer(
              duration: duration,
              width: size,
              height: size,
              child: AnimatedCrossFade(
                  layoutBuilder:
                      (topChild, topChildKey, bottomChild, bottomChildKey) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          key: bottomChildKey,
                          child: bottomChild,
                        ),
                        Positioned.fill(
                          key: topChildKey,
                          child: topChild,
                        ),
                      ],
                    );
                  },
                  firstChild: Image.asset(
                    'images/common/photo_pencil.png',
                    fit: BoxFit.cover,
                  ),
                  secondChild: Image.asset(
                    'images/common/photo_school.png',
                    fit: BoxFit.cover,
                  ),
                  crossFadeState: selected
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: duration),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('ExpandCard')),
      body: Center(
        child: bodyWidget,
      ),
    );
  }
}

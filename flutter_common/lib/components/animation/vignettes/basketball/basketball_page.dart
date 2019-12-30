import 'package:flutter/material.dart';
import 'package:flutter_common/components/animation/vignettes/shared/ui/animated_sprite.dart';
import 'package:flutter_common/components/animation/vignettes/shared/ui/sprite.dart';
import 'package:flutter_common/components/animation/vignettes/ticket_fold/folding_ticket.dart';

class BasketBallPage extends StatefulWidget {
  @override
  State createState() => _BasketBallPageState();
}

class _BasketBallPageState extends State<BasketBallPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _spriteAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _spriteAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 19.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20.0, end: 39.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 20.0, end: 39.0),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 40.0, end: 59.0),
        weight: 1,
      ),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _controller.repeat(reverse: true);
    return Container(
     margin: EdgeInsets.symmetric(vertical: 390,horizontal: 190),
      child: AnimatedSprite(
          image: AssetImage('images/basketball/basketball.png'),
          frameWidth: 400,
          frameHeight: 400,
          animation: _spriteAnimation),
    );
  }
}

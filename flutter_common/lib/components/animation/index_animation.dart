import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'basics/animated_builder_page.dart';
import 'basics/animated_sequence_page.dart';
import 'basics/animation_container_page.dart';
import 'basics/animation_controller_page.dart';
import 'basics/animation_tweens_page.dart';
import 'basics/custom_tween_page.dart';
import 'basics/page_route_page.dart';
import 'misc/carousel_page.dart';
import 'misc/expand_card_page.dart';
import 'misc/focus_image_page.dart';
import 'misc/repeating_animation_page.dart';

class Item {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Item({this.name, this.route, this.builder});
}

class IndexAnimationComponent extends StatefulWidget {
  @override
  _IndexAnimationComponentState createState() =>
      _IndexAnimationComponentState();
}

class _IndexAnimationComponentState extends State<IndexAnimationComponent> {
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(title: Text('Animation')),
      body: ListView(
        children: <Widget>[
          ListTile(
              title: Text(
            'Basics',
            style: headerStyle,
          )),
          ...basicItems.map((d) => ItemWidget(d)),
          ListTile(title: Text('Misc', style: headerStyle)),
          ...miscItems.map((d) => ItemWidget(d))
        ],
      ),
    );
  }
}

final basicItems = [
  Item(
      name: 'AnimatedContainer',
      builder: (context) => AnimationContainerPage()),
  Item(name: 'PageRouteBuilder', builder: (context) => PageRouteBuilderPage()),
  Item(
      name: 'Animation Controller',
      builder: (context) => AnimationControllerPage()),
  Item(name: 'Tweens', builder: (context) => AnimationTweenPage()),
  Item(name: 'AnimatedBuilder', builder: (context) => AnimatedBuilderPage()),
  Item(name: 'Custom Tween', builder: (context) => CustomTweenPage()),
  Item(name: 'Tween Sequences', builder: (context) => AnimatedSequencePage()),
];

final miscItems = [
  Item(
      name: 'Expandable Card',
      builder: (context) => ExpandCardPage()),
  Item(
    name: 'Carousel',
      builder: (context) => CarouselPage()
  ),
  Item(
      name: 'Focus Image',
//      route: FocusImageDemo.routeName,
      builder: (context) => FocusImagePage()),
//  Item(
//    name: 'Card Swipe',
//      route: CardSwipeDemo.routeName,
//      builder: (context) => CardSwipeDemo()
//  ),
  Item(
      name: 'Repeating Animation',
//      route: RepeatingAnimationDemo.routeName,
      builder: (context) => RepeatingAnimationPage()),
//  Item(
//    name: 'Spring Physics',
////      route: PhysicsCardDragDemo.routeName,
////      builder: (context) => PhysicsCardDragDemo()
//  ),
];

class ItemWidget extends StatelessWidget {
  final Item item;

  ItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: item.builder)),
    );
  }
}

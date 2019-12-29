import 'package:flutter/material.dart';

class FocusImagePage extends StatefulWidget {
  @override
  State createState() => _FocusImagePageState();
}

class _FocusImagePageState extends State<FocusImagePage> {
  Widget bodyWidget = GridView.builder(
    itemCount: 40,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    itemBuilder: (context, index) {
      return (index >= 20)
          ? SmallCard('images/common/photo_pencil.png')
          : SmallCard('images/common/photo_school.png');
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('focusimage'),
      ),
      body: bodyWidget,
    );
  }
}

class SmallCard extends StatelessWidget {
  final String imageAssetName;

  SmallCard(this.imageAssetName);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
            onTap: () {
              var nav = Navigator.of(context);
              nav.push(_createRoute(context, imageAssetName));
            },
            child: Image.asset(imageAssetName)),
      ),
    );
  }
}

Route _createRoute(BuildContext parentContext, String image) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return _SecondPage(image);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var rectAnimation = _createTween(parentContext)
            .chain(CurveTween(curve: Curves.ease))
            .animate(animation);

        return Stack(
          children: [
            PositionedTransition(rect: rectAnimation, child: child),
          ],
        );
      },transitionDuration: const Duration(milliseconds: 400));
}

Tween<RelativeRect> _createTween(BuildContext context) {
  var windowSize = MediaQuery.of(context).size;
  var box = context.findRenderObject() as RenderBox;
  var rect = box.localToGlobal(Offset.zero) & box.size;
  var relativeRect = RelativeRect.fromSize(rect, windowSize);
  return RelativeRectTween(
    begin: relativeRect,
    end: RelativeRect.fill,
  );
}

class _SecondPage extends StatelessWidget {
  final String imageAssetName;

  _SecondPage(this.imageAssetName);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imageAssetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

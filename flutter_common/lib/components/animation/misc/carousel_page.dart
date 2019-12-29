import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  static const List<String> fileNames = [
    'images/common/photo_school.png',
    'images/common/photo_coffee_shop.png',
    'images/common/photo_museum.png',
  ];
  final List<Widget> images =
      fileNames.map((file) => Image.asset(file, fit: BoxFit.cover)).toList();

  @override
  State createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Carousel(itemBuilder: widgetBuilder),
          ),
        ),
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index) {
    return widget.images[index % widget.images.length];
  }
}

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({Key key, @required this.itemBuilder});

  @override
  State createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  int _currentPage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller =
        PageController(viewportFraction: .85, initialPage: _currentPage);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return PageView.builder(
        controller: _controller,
        onPageChanged: (value) {
          setState(() {
            _pageHasChanged = true;
            _currentPage = value;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              var result =
                  _pageHasChanged ? _controller.page : _currentPage * 1.0;
              // The horizontal position of the page between a 1 and 0
              var value = result - index;
              value = (1 - (value.abs() * .5)).clamp(0.0, 1.0) as double;
              return Center(
                child: SizedBox(
                    width: Curves.easeOut.transform(value) * size.width,
                    height: Curves.easeOut.transform(value) * size.height,
                    child: child),
              );
            },
            child: widget.itemBuilder(context, index),
          );
        });
  }
}

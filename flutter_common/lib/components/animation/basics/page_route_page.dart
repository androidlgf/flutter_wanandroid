import 'package:flutter/material.dart';
import 'package:flutter_common/common/utils/route_util.dart';

class PageRouteBuilderPage extends StatefulWidget {
  @override
  State createState() => _PageRouteBuilderPageState();
}

class _PageRouteBuilderPageState extends State<PageRouteBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('animation_page_route')),
      body: Center(
        child: RaisedButton(
          child: Text('Go!'),
          onPressed: () {
            pushSlideLeftInNewPage(context, _Page2());
          },
        ),
      ),
    );
  }
}

class _Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2!', style: Theme
            .of(context)
            .textTheme
            .display1),
      ),
    );
  }
}
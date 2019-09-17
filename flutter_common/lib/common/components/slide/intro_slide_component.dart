import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

//首次启动页面
class IntroSlideComponent extends StatefulWidget {
  @override
  _IntroSlideComponentState createState() => _IntroSlideComponentState();
}

class _IntroSlideComponentState extends State<IntroSlideComponent> {
  List<Slide> _slides = [];

  @override
  void initState() {
    super.initState();
    _slides.add(
      Slide(
        title: "SCHOOL",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/common/photo_school.png",
      ),
    );
    _slides.add(
      Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/common/photo_museum.png",
      ),
    );
    _slides.add(
      Slide(
        title: "COFFEE SHOP",
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xfffe9c8f),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/common/photo_coffee_shop.png",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: _slides,
      onDonePress: this.onDonePress,
      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      // Next button
      renderNextBtn: this.renderNextBtn(),
      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      // Show or hide status bar
      shouldHideStatusBar: true,
    );
  }

  void onDonePress() {
    debugPrint('intro silde click with onDonePress');
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffffcc5c),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffffcc5c),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffffcc5c),
    );
  }
}

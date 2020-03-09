import 'package:flutter/cupertino.dart';

/// StatelessWidget面向那些始终不变的UI控件，比如标题栏中的标题
class SpeechStateLessWidget extends StatelessWidget {
  final String index;
  final String title;

  //构造器
  SpeechStateLessWidget({Key key, this.title, this.index})
      : assert(index != null, title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

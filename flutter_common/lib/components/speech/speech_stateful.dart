import 'package:flutter/cupertino.dart';

///StatefulWidget则是面向可能会改变UI状态的控件，比如有点击反馈的按钮。
class SpeechStateFulWidget extends StatefulWidget {
  @override
  _SpeechStateFulWidgetState createState() => _SpeechStateFulWidgetState();
}

class _SpeechStateFulWidgetState extends State<SpeechStateFulWidget> {
  ///当插入渲染树的时候调用，这个函数在生命周期中只调用一次。这里可以做一些初始化工作，比如初始化State的变量
  @override
  void initState() {
    super.initState();
  }

  ///当此[状态]对象的依赖项更改时调用
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  ///每当小部件配置更改时调用
  @override
  void didUpdateWidget(SpeechStateFulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  ///从树中移除此对象时调用
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  ///当此对象从树中永久移除时调用
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

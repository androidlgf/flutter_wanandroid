import 'package:flutter/material.dart';

 //所有 BLoCs 的通用接口
abstract class MyBlocBase {
  void dispose();

  void initState();

  void didChangeDependencies();
}

 //通用 BLoC provider
class MyBlocProvider<T extends MyBlocBase> extends StatefulWidget {
  MyBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);
  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() {
    return _BlocProviderState<T>();
  }

  static T of<T extends MyBlocBase>(BuildContext context) {
    final type = _typeOf<MyBlocProvider<T>>();
    MyBlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<MyBlocProvider<MyBlocBase>> {
  @override
  void initState() {
    super.initState();
    widget.bloc?.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.bloc?.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc?.dispose();
    super.dispose();
  }
}

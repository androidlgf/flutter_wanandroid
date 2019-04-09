import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//重复刷新解决
// 1.AsyncMemoizer asyncMemoizer = AsyncMemoizer(); memoizer.runOnce(() async{}
// 2.initState()/
class CommonFutureBuilder<T> extends StatefulWidget {
  CommonFutureBuilder(
      {@required this.contentWidget,
      this.future,
      this.connectionSucceed,
      this.connectionError});

  final Widget contentWidget;
  final Future<T> future;
  final Function(Object response) connectionSucceed;
  final Function(Object errorInfo) connectionError;

  @override
  State<StatefulWidget> createState() {
    return _CommonFutureBuilderState();
  }
}

class _CommonFutureBuilderState extends State<CommonFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: _buildFuture,
      future: widget.future,
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return Center(
          child: Text('Not currently connected to any asynchronous computation',
              style: TextStyle(color: Colors.transparent)),
        );
      case ConnectionState.active:
        return Center(
          child: Text('ConnectionState.active',
              style: TextStyle(color: Colors.transparent)),
        );
      case ConnectionState.waiting:
        return Center(
          child: SpinKitCircle(color: Colors.red),
        );
      case ConnectionState.done:
        if (snapshot.hasError) {
          if (widget.connectionError != null) {
            widget.connectionError(snapshot.error);
          }
          final snackBar = new SnackBar(content: new Text(snapshot.error));

          Scaffold.of(context).showSnackBar(snackBar);
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (widget.connectionSucceed != null) {
          widget.connectionSucceed(snapshot.data);
        }
        return widget.contentWidget != null
            ? widget.contentWidget
            : Container(
                child: Text('data: ${snapshot.data.toString()}'),
              );
      default:
        return null;
    }
  }
}

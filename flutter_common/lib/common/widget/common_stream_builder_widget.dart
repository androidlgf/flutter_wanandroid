import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonStreamBuilder<T> extends StatefulWidget {
  const CommonStreamBuilder(
      {Key key,
      this.waitingWidget,
      this.errorWidget,
      this.emptyWidget,
      this.stream,
      this.builder})
      : super(key: key);

  //加载中Widget/
  final Widget waitingWidget;

  //网络失败Widget/
  final Widget errorWidget;

  //空布局/
  final Widget emptyWidget;

  final Stream<T> stream;
  final AsyncWidgetBuilder<T> builder;

  @override
  State<StatefulWidget> createState() {
    return _CommonStreamBuilderState();
  }
}

class _CommonStreamBuilderState extends State<CommonStreamBuilder> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isConnectedNone = false;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isConnectedNone = result == ConnectivityResult.none;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot?.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              if (isConnectedNone) {
                return _buildConnectedNoneWidget(context);
              } else {
                return widget.waitingWidget != null
                    ? widget.errorWidget
                    : _buildWaitingWidget(context);
              }
              break;
            case ConnectionState.done:
              break;
          }
          if (snapshot.hasError) {
            return widget.errorWidget != null
                ? widget.errorWidget
                : _buildErrorWidget(context, snapshot.error.toString());
          }
          if (snapshot.hasData && widget.builder != null) {
            return widget.builder(context, snapshot);
          }
          return _buildEmptyWidget(context);
        });
  }

  Widget _buildErrorWidget(BuildContext context, errorInfo) {
    final snackBar = new SnackBar(content: new Text(errorInfo));

    Scaffold.of(context).showSnackBar(snackBar);
    return Container(
      height: 0.0,
    );
  }

  Widget _buildConnectedNoneWidget(BuildContext context) {
    return Center(
      child: Text('网络不可用',style: TextStyle(color: Colors.black),),
    );
  }

  Widget _buildWaitingWidget(BuildContext context) {
    return Center(child: SpinKitCircle(color: Colors.red));
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Center();
  }

  Widget _buildContentWidget(BuildContext context) {
    return Container(
      height: 0.0,
    );
  }
}

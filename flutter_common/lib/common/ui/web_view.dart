import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage({@required this.url, this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

// On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  StreamSubscription<WebViewHttpError> _onHttpError;

  StreamSubscription<double> _onProgressChanged;

  StreamSubscription<double> _onScrollYChanged;

  StreamSubscription<double> _onScrollXChanged;
  bool showLoading = false;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();
    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
      }
    });
    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {}
    });
    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {}
    });
    _onScrollYChanged =
        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {}
    });

    _onScrollXChanged =
        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {}
    });
    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {}
    });

    /// initialChild只有第一网页加载时会显示，网页内部页面跳转不会再显示，所以要手动加上页面内跳转监听
    _onStateChanged = flutterWebViewPlugin.onStateChanged.listen((state) {
      debugPrint('_WebViewPageState.initState  state = ${state.type}');
      if (state.type == WebViewState.shouldStart) {
        setState(() {
          showLoading = true;
        });
      } else if (state.type == WebViewState.finishLoad ||
          state.type == WebViewState.abortLoad) {
        setState(() {
          showLoading = false;
        });
      }
    });
  }
  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onProgressChanged.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();

    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title ?? ''),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Share.share(this.widget.url);
            },
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
          child: showLoading
              ? LinearProgressIndicator(backgroundColor: Colors.grey)
              : Container(),
          preferredSize: Size(double.infinity, 1),
        ),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      withJavascript: true,
      initialChild:
          Container(child: const Center(child: CupertinoActivityIndicator())),
    );
  }
}

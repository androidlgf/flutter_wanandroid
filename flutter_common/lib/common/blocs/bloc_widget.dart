import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/common/ui/button.dart';
import 'package:flutter_common/generated/i18n.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

///builder 为网络请求数据功能创建的控件回调
class BlocWidget<T extends Bloc<dynamic, BlocState>> extends StatelessWidget {
  BlocWidget(
      {Key key,
      this.builder,
      this.waitingWidget,
      this.failureWidget,
      this.emptyWidget,
      this.onReload,
      this.reloadText,
      this.errorTip,
      this.emptyTip})
      : assert(builder != null),
        super(key: key);

  //内容区
  final BlocBuilder builder;

  //加载中Widget/
  final Widget waitingWidget;

  //网络失败Widget/
  final Widget failureWidget;

  //空布局/
  final Widget emptyWidget;

  //错误 重试函数
  final Function onReload;

  //错误 重试按钮文本
  final String reloadText;

  //错误 重试提示语
  final String errorTip;

  //空布局 提示语
  final String emptyTip;

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    return BlocListener<T, BlocState>(
      listener: (context, state) {
        ///发生错误提示
        if (state is BlocFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
            ),
          );
          return;
        }

        ///展示SnackBar提示
        if (state is BlocShowSnackBar) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.message}'),
            ),
          );
          return;
        }

        ///展示Toast提示
        if (state is BlocShowMessage) {
          Fluttertoast.showToast(msg: '${state.message}');
          return;
        }
      },

      ///state状态 默认处理网络请求失败 空布局 loading三种状态 其它状态外部Builder实现
      child: BlocBuilder<T, BlocState>(builder: (context, state) {
        Widget currentWidget;
        if (state is BlocLoading) {
          currentWidget = this.waitingWidget ?? _ClassicalLoadingView();
        } else if (state is BlocFailure) {
          currentWidget = this.failureWidget ??
              _ClassicalErrorView(
                onReload: this.onReload,
                reloadText: this.reloadText,
                errorTip: this.errorTip,
              );
        } else if (state is BlocEmpty) {
          currentWidget =
              this.emptyWidget ?? _ClassicalNoDataView(emptyTip: this.emptyTip);
        } else {
          currentWidget = this.builder.build(context, state);
        }
        return currentWidget;
      }),
    );
  }
}

///默认Loading
class _ClassicalLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
          child: SpinKitCircle(
        color: colorPrimary,
      ));
}

//默认空布局
class _ClassicalNoDataView extends StatelessWidget {
  final String emptyTip;

  _ClassicalNoDataView({this.emptyTip}) : super();

  @override
  Widget build(BuildContext context) => Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Icon(Icons.signal_cellular_no_sim,
                size: 70, color: Colors.grey[300]),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(emptyTip ?? '${S.of(context).no_data}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[400])))
          ]));
}

///默认加载失败布局
class _ClassicalErrorView extends StatelessWidget {
  _ClassicalErrorView({@required this.onReload, this.reloadText, this.errorTip})
      : super();

  final Function onReload;
  final String reloadText;
  final String errorTip;

  @override
  Widget build(BuildContext context) => Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Icon(Icons.portable_wifi_off, size: 70, color: Colors.grey[500]),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(errorTip ?? '${S.of(context).no_network_connect}',
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[400]))),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Button(
                text: reloadText ?? '${S.of(context).get_reload}',
                onPressed: onReload,
                height: 30,
                width: 80,
                borderRadius: 20,
                textSize: 14)
          ]));
}

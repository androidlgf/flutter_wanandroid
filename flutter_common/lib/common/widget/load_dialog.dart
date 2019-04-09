import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadDialog extends Dialog {
  LoadDialog({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: WillPopScope(
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(45, 48, 50, 1),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SpinKitCircle(color: Colors.black87),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(title ?? ''),
                  )
                ],
              ),
            ),
          ),
          onWillPop: () {
            Future.value(null);
          }),
    );
  }
}

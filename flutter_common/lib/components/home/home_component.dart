import 'package:flutter/material.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponentState createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老梁'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Text('老梁'),
            RaisedButton(
              onPressed: (){},
              child: Text('点击吧骚年'),
            ),
            FloatingActionButton(child: Text('11'),),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

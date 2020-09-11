import 'package:first_app/main-drawer.dart';
import 'package:flutter/material.dart';
import './main-drawer.dart';


void main() => runApp(MaterialApp(
  home: MyApp(),
));
class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First App'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
            child: Text(
              'Hello',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            )),
      drawer: MainDrawer(),
    );
  }
}
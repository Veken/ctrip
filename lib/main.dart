import 'package:flutter/material.dart';
import 'package:ctrip/navigator/tab_navigator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Ctrip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabNavigator(),
    );
  }
}

void main() {
  runApp(MyApp());
}
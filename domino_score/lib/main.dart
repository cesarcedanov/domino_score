import 'package:flutter/material.dart';
import './screens/tabs_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domino Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsNavigation(),
    );
  }
}

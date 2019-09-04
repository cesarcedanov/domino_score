import 'package:flutter/material.dart';
import './screens/score_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domino Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScoreScreen(),
    );
  }
}

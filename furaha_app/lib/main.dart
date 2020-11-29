import 'package:flutter/material.dart';
import 'package:furaha_app/views/opening_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Opening Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpeningScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/layout_template.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutTemplate(),
    );
  }
}

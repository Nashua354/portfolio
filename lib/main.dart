import 'package:flutter/material.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/routing/routing.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';

void main() {
  setupLocator();
  RouteHandler().defineRoutes();
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteHandler.router.generator,
      home: HomeScreen(),
    );
  }
}

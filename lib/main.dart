import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/isdark_bloc/isdark_bloc.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/routing/routing.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:portfolio/services/app_theme.dart';

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
    return BlocBuilder(
        bloc: locator<IsdarkBloc>(),
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state is DarkState ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteHandler.router.generator,
            home: HomeScreen(),
          );
        });
  }
}

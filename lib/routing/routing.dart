import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/articles/articles.dart';
import 'package:portfolio/screens/home_screen/home_screen.dart';
import 'package:portfolio/screens/poems_screen/poem_view.dart';
import 'package:portfolio/screens/poems_screen/poems_screen.dart';
import 'package:portfolio/screens/projects/projects.dart';
import 'package:portfolio/screens/resume/resume.dart';

class RouteHandler {
  static Router router = Router();

  var homescreenHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomeScreen();
  });
  var poemscreenHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return PoemsScreen();
  });
  var articleScreenHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ArticlesScreen();
  });
  var resumeScreenHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ResumeScreen();
  });
  var projectScreenHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ProjectsScreen();
  });
  var poemViewHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return PoemView(title: params["title"][0]);
  });

  void defineRoutes() {
    router.define(RouteNames.homeRoute,
        handler: homescreenHandler, transitionType: TransitionType.fadeIn);
    router.define(RouteNames.poemsRoute,
        handler: poemscreenHandler, transitionType: TransitionType.fadeIn);
    router.define(RouteNames.articlesRoute,
        handler: articleScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(RouteNames.projectsRoute,
        handler: projectScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(RouteNames.resumeRoute,
        handler: resumeScreenHandler, transitionType: TransitionType.fadeIn);
    router.define(RouteNames.poemViewRoute,
        handler: poemViewHandler, transitionType: TransitionType.fadeIn);
  }
}

class RouteNames {
  static const String homeRoute = "/";
  static const String poemsRoute = "/poems";
  static const String articlesRoute = "/articles";
  static const String resumeRoute = "/resume";
  static const String projectsRoute = "/projects";
  static const String poemViewRoute = "/poems/:title";
}

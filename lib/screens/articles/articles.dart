import 'package:flutter/material.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class ArticlesScreen extends CustomScaffold {
  @override
  Widget body(context) {
    sideNavEnable("ARTICLES");
    return Text("articles");
  }
}

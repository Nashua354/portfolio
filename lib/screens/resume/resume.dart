import 'package:flutter/material.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class ResumeScreen extends CustomScaffold {
  @override
  Widget body(context) {
    sideNavEnable("RESUME");
    return Text("resume");
  }
}

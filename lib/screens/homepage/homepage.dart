import 'package:flutter/material.dart';
import 'package:portfolio/screens/homepage/sections/bold_section.dart';
import 'package:portfolio/screens/homepage/widgets/side_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideNavBar(),
        // PrimarySection(),
        // SecondarySection(),
        BoldSection(),
      ],
    );
  }
}

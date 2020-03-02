import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class BoldSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.primarySection,
      widthRatio: 1.25,
      child: Text('testing'),
    );
  }
}

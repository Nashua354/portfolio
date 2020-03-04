import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class SecondarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.secondarySection,
      widthRatio: 1.82,
      child: Text('testing'),
    );
  }
}

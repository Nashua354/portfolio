import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class PrimarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.primarySection,
      widthRatio: 4,
      child: Text('testing\n testing'),
    );
  }
}

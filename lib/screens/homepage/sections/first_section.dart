import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/controllers/primary_section_controller.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class PrimarySection extends StatelessWidget {
  PrimarySectionController primarySectionController =
      locator<PrimarySectionController>();
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.primarySection,
      widthRatio: 4,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                primarySectionController
                    .renderSecondarySection([Text("index : $index")]);
              },
              child: Container(
                child: Card(
                  child: Text('index: $index'),
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/controllers/primary_section_controller.dart';
import 'package:portfolio/controllers/secondary_section_controller.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/homepage/widgets/poem_tile.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class PrimarySection extends StatelessWidget {
  PrimarySectionController primarySectionController = locator<PrimarySectionController>();
  SavedData savedData = locator<SavedData>();
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.primarySection,
      widthRatio: 4,
      rightPadding: 0,
      child: BlocBuilder(
          bloc: primarySectionController.primarySectionBloc,
          builder: (context, state) {
            // if (state is PoetryPrimarySectionState) {
            SecondarySectionController().poemsReset(0);
            return Scrollbar(
              child: ListView.builder(
                  itemCount: savedData.poemsParser.poems.length,
                  itemBuilder: (context, index) {
                    return PoetryTile(
                      key: UniqueKey(),
                      index: index,
                    ).showCursorOnHover.moveRightOnHover;
                  }),
            );
            // } else
            //   return Text("OTHERS");
          }),
    );
  }
}

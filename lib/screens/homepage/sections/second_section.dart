import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_bloc.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class SecondarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.secondarySection,
      widthRatio: 1.82,
      child: BlocBuilder(
        bloc: locator<SecondarySectionBloc>(),
        builder: (context, state) {
          return ListView(
            children: state.content,
          );
        },
      ),
    );
  }
}

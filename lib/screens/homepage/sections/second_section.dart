import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_states.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class SecondarySection extends StatefulWidget {
  @override
  _SecondarySectionState createState() => _SecondarySectionState();
}

class _SecondarySectionState extends State<SecondarySection> {
  SideNavBloc sideNavBloc = locator<SideNavBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sideNavBloc,
        builder: (context, sideNavState) {
          return PrimaryVerticalLayout(
            backgroundColor: CommonColors.secondarySection,
            widthRatio: sideNavState is SideBarEnabledState ? 1.82 : 1.335,
            rightPadding: 0,
            leftPadding: 0,
            topPadding: 0,
            child: BlocBuilder(
              bloc: locator<SecondarySectionBloc>(),
              builder: (context, state) {
                if (state is InitialSecondarySectionState) {
                  return Container();
                } else if (state is RenderSecondarySectionState) {
                  return state.content;
                } else
                  return Container();
              },
            ),
          );
        });
  }
}

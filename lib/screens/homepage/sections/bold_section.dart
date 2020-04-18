import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/screens/homepage/widgets/main_home_section.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class BoldSection extends StatefulWidget {
  @override
  _BoldSectionState createState() => _BoldSectionState();
}

class _BoldSectionState extends State<BoldSection> {
  SideNavBloc sideNavBloc = locator<SideNavBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: sideNavBloc,
        builder: (context, state) {
          return PrimaryVerticalLayout(
            backgroundColor: CommonColors.primarySection,
            widthRatio: state is SideBarEnabledState ? 1.25 : 1,
            rightPadding: 0,
            child: HomeSection(),
          );
        });
  }
}

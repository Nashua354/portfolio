import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';
import 'package:portfolio/widgets/sidenav/side_navbar.dart';

class CustomScaffold extends StatelessWidget {
  SideNavBloc sideNavBloc = locator<SideNavBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideNavBar(
        child: BlocBuilder(
            bloc: sideNavBloc,
            builder: (context, state) {
              return PrimaryVerticalLayout(
                backgroundColor: CommonColors.primaryColor,
                widthRatio: state is SideBarEnabledState ? 1.25 : 1.048,
                rightPadding: 0,
                leftPadding: 0,
                topPadding: 0,
                child: body(context),
              );
            }),
      ),
    );
  }

  Widget body(context) {
    return Container();
  }
}

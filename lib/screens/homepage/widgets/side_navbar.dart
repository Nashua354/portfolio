import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/side_nav_data.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/screens/homepage/widgets/nav_tile.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class SideNavBar extends StatelessWidget {
  SideNavBloc sideNavBloc = locator<SideNavBloc>();
  //Type, Name, Active,
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: sideNavBloc,
      builder: (context, state) {
        if (state is SideBarEnabledState)
          return PrimaryVerticalLayout(
            backgroundColor: CommonColors.sideBar,
            widthRatio: 5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: sideNav.length,
              itemBuilder: (context, index) {
                return NavItem(
                  key: UniqueKey(),
                  item: sideNav[index],
                );
              },
            ),
          );
        else
          return Container();
      },
    );
  }
}

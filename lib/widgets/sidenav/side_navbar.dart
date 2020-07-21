import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_events.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';
import 'package:portfolio/widgets/sidenav/mini_nav_item.dart';
import 'package:portfolio/widgets/sidenav/nav_item.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class SideNavBar extends StatelessWidget {
  Widget child;
  SideNavBar({this.child});
  SideNavBloc sideNavBloc = locator<SideNavBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        BlocBuilder(
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
              return PrimaryVerticalLayout(
                backgroundColor: CommonColors.sideBar,
                rightPadding: 8,
                leftPadding: 8,
                widthRatio: 22,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: sideNav.length,
                  itemBuilder: (context, index) {
                    return MiniNavItem(
                      item: sideNav[index],
                      key: UniqueKey(),
                      // item: sideNav[index],
                    );
                  },
                ),
              );
          },
        ),
        Stack(
          children: <Widget>[
            child == null ? Container() : child,
            navArrow(),
          ],
        )
      ],
    );
  }

  Widget navArrow() {
    return Positioned(
      top: 20,
      left: -10,
      child: BlocBuilder(
        bloc: sideNavBloc,
        builder: (context, state) {
          return InkWell(
            onTap: () {
              if (state is SideBarEnabledState)
                sideNavBloc.add(DisableSideBarEvent());
              else if (state is SideBarDisabledState) sideNavBloc.add(EnableSideBarEvent());
            },
            child: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.only(),
              decoration: BoxDecoration(
                  color: CommonColors.sideBar,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
              child: Icon(
                  state is SideBarEnabledState ? Icons.arrow_back_ios : Icons.arrow_forward_ios),
            ).showCursorOnHover.moveRightOnHover,
          );
        },
      ),
    );
  }
}

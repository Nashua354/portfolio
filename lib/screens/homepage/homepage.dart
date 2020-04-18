import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_states.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_events.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/controllers/home_page_controller.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/screens/homepage/sections/bold_section.dart';
import 'package:portfolio/screens/homepage/sections/first_section.dart';
import 'package:portfolio/screens/homepage/sections/second_section.dart';
import 'package:portfolio/screens/homepage/widgets/side_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = HomePageController();
  SideNavBloc sideBloc = locator<SideNavBloc>();
  @override
  void initState() {
    super.initState();
    homePageController.initiate();
  }

  @override
  void dispose() {
    super.dispose();
    sideBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideNavBar(),
        Stack(
          children: <Widget>[
            BlocBuilder(
              bloc: locator<HomePageBloc>(),
              builder: (context, state) {
                if (state is SingleSectionState)
                  return BoldSection();
                else if (state is TwoSectionState)
                  return Row(
                    children: <Widget>[PrimarySection(), SecondarySection()],
                  );
                else
                  return Container();
              },
            ),
            Positioned(
              top: 20,
              left: -10,
              child: BlocBuilder(
                bloc: sideBloc,
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (state is SideBarEnabledState)
                        sideBloc.add(DisableSideBarEvent());
                      else if (state is SideBarDisabledState) sideBloc.add(EnableSideBarEvent());
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.only(),
                      decoration: BoxDecoration(
                          color: CommonColors.sideBar,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
                      child: Icon(state is SideBarEnabledState
                          ? Icons.arrow_back_ios
                          : Icons.arrow_forward_ios),
                    ).showCursorOnHover.moveRightOnHover,
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

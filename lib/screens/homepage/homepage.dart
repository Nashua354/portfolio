import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_states.dart';
import 'package:portfolio/controllers/home_page_controller.dart';
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
  @override
  void initState() {
    super.initState();
    homePageController.initiate();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideNavBar(),
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
        )
      ],
    );
  }
}

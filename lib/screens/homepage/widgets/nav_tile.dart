import 'package:flutter/material.dart';
import 'package:portfolio/blocs/homePage/home_page_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_events.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/custom_divider.dart';

class NavItem extends StatelessWidget {
  final Widget navItem;
  NavItem({this.navItem});
  HomePageBloc homePageBloc = locator<HomePageBloc>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        // print("color changed");
      },
      onTap: () {
        if (navItem is Text) {
          print("TEXT");
          homePageBloc.add(TwoSectionEvent());
        } else {
          print("OTHERS");
          homePageBloc.add(SingleSectionEvent());
        }
      },
      child: Column(
        children: <Widget>[
          CustomDivider(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: navItem,
          ),
        ],
      ),
    );
  }
}

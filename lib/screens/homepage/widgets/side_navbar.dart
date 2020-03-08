import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/screens/homepage/widgets/nav_tile.dart';
import 'package:portfolio/screens/homepage/widgets/social_media_tile.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class SideNavBar extends StatelessWidget {
  final List<Widget> navItems = [
    Image.asset('assets/images/logo.png'),
    Text('projects'.toUpperCase()),
    Text('poetry'.toUpperCase()),
    Text('bonus'.toUpperCase()),
    Text('resume'.toUpperCase()),
    SocialMediaTile(),
  ];
  //Type, Name, Active,
  @override
  Widget build(BuildContext context) {
    return PrimaryVerticalLayout(
      backgroundColor: CommonColors.sideBar,
      widthRatio: 5,
      child: BlocBuilder(
        bloc: locator<SideNavBloc>(),
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: navItems.length,
            itemBuilder: (context, index) {
              return NavItem(
                navItem: navItems[index],
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_events.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_states.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/routing/routing.dart';
import 'package:portfolio/widgets/custom_divider.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';
import 'package:portfolio/widgets/sidenav/social_media_tile.dart';

class NavItem extends StatefulWidget {
  final Key key;
  final Map item;
  NavItem({this.key, this.item}) : super(key: key);
  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  Widget navItem;
  Function func;
  HighLightBloc highLightBloc = HighLightBloc();
  @override
  void initState() {
    if (widget.item["type"] == "text") {
      navItem = Tooltip(
        waitDuration: Duration(seconds: 0),
        message: widget.item['label'],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            widget.item["label"],
            style: TextStyle(fontFamily: 'work_sans'),
          ),
        ).showCursorOnHover.moveRightOnHover,
      );
      switch (widget.item["label"]) {
        case "POETRY":
          func = () {
            resetIsEnable();
            RouteHandler.router.navigateTo(context, RouteNames.poemsRoute);
            // homePageBloc.add(TwoSectionEvent());
            // SavedData savedData = locator<SavedData>();
            // primarySectionBloc.add(PoetryPrimarySectionEvent(poemsParser: savedData.poemsParser));
          };
          break;
        case "PROJECTS":
          func = () {
            resetIsEnable();
            RouteHandler.router.navigateTo(context, RouteNames.projectsRoute);
          };
          break;
        case "ARTICLES":
          func = () {
            resetIsEnable();
            RouteHandler.router.navigateTo(context, RouteNames.articlesRoute);
          };
          break;
        case "RESUME":
          func = () {
            resetIsEnable();
            RouteHandler.router.navigateTo(context, RouteNames.resumeRoute);
          };
          break;
      }
    }
    if (widget.item["type"] == "social")
      navItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SocialMediaTile(),
      );
    if (widget.item["type"] == "logo") {
      navItem = Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Tooltip(message: "Home", child: Image.asset(widget.item["label"])),
      ).showCursorOnHover;
      func = () {
        resetIsEnable();
        widget.item["isActive"] = false;
        RouteHandler.router.navigateTo(context, RouteNames.homeRoute);
      };
    }

    super.initState();
  }

  resetIsEnable() {
    sideNav.forEach((item) {
      item["isActive"] = false;
    });
    widget.item["isActive"] = true;
  }

  @override
  void dispose() {
    highLightBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: highLightBloc,
        builder: (context, state) {
          if (widget.item["type"] != "logo")
            highLightBloc.add(EnableHighLightEvent(widget.item["isActive"]));
          return InkWell(
            onHover: (value) {
              // print("color changed");
            },
            onTap: func,
            child: Column(
              children: <Widget>[
                CustomDivider(),
                Container(
                  color: state is EnableHighLightState ? Colors.blueGrey : Colors.transparent,
                  width: double.infinity,
                  child: Center(child: navItem),
                ),
              ],
            ),
          );
        });
  }
}

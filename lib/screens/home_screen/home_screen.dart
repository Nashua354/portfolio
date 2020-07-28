import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:portfolio/blocs/isdark_bloc/isdark_bloc.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class HomeScreen extends CustomScaffold {
  @override
  Widget body(context) {
    sideNavEnable("assets/images/logo.png");
    return Stack(
      children: <Widget>[
        CircularParticle(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          onTapAnimation: false,
          numberOfParticles: 20,
          speedOfParticles: 1,
          maxParticleSize: 10,
          isRandomColor: false,
          particleColor: Colors.black.withOpacity(0.2),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/geek.png',
              height: 500,
              width: 500,
            ),
          ),
        ),
        Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              heading("Hi"),
              heading("I'm Nitish Sahani\n"),
              heading("A Software Engineer"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  heading("on a "),
                  Image.asset(
                    "assets/images/tech/mission.png",
                    height: 40,
                    width: 40,
                  ),
                  heading("Mission to"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/tech/unlock.png",
                    height: 30,
                    width: 30,
                  ),
                  heading(" Unlock my skills,"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/tech/upgrade.png",
                    height: 30,
                    width: 30,
                  ),
                  heading(" Upgrade my levels"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  heading("and "),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightGreen),
                        borderRadius: BorderRadius.circular(100)),
                    child: Image.asset(
                      "assets/images/tech/win.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  heading(" Win the game."),
                ],
              ),
              heading("\nCurrent Weapons", size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logo("flutter", "Flutter"),
                  logo("react", "React"),
                  logo("firebase", "Firebase"),
                  logo("graphql", "GraphQL"),
                  logo("javascript", "JavaScript"),
                  logo("dart", "Dart"),
                ],
              ),
              heading("Upgrading/Learning Secondary Weapons", size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[logo("nodejs", "Node.JS"), logo("deno", "Deno")],
              ),
              heading("Gear in Backpack / Familiar with", size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  logo("c++", "C++"),
                  logo("python", "Python"),
                  logo("machine_learning", "Machine Learning"),
                ],
              )
            ],
          ),
        )),
        Positioned(
          right: 20,
          top: 20,
          child: InkWell(
            onTap: () {
              locator<IsdarkBloc>().add(ToggleDarkModeEvent());
            },
            child: Card(
              child: Tooltip(
                message: 'Built with Flutter',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Built with ',
                        style: TextStyle(fontSize: 15),
                      ),
                      FlutterLogo(
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ).showCursorOnHover.shadowOnHover,
          ),
        ),
      ],
    );
  }

  Widget heading(String text, {double size = 30}) {
    return SelectableText(
      text,
      enableInteractiveSelection: true,
      style: TextStyle(color: CommonColors.textColor, fontSize: size, fontFamily: "work_sans"),
    );
  }

  Widget logo(String imageName, String toolTip, {bool isjpg = false}) {
    String extsn = "png";
    if (isjpg) extsn = "jpg";
    return Card(
      child: Tooltip(
        message: toolTip,
        child: Container(
          margin: EdgeInsets.all(8),
          child: Image.asset(
            "assets/images/tech/$imageName.$extsn",
            height: 40,
            width: 40,
            // color: Colors.blue,
          ),
        ),
      ),
    ).showCursorOnHover.shadowOnHover;
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SideNavBar(
  //       child: BlocBuilder(
  //           bloc: sideNavBloc,
  //           builder: (context, state) {
  //             return PrimaryVerticalLayout(
  //               backgroundColor: CommonColors.primarySection,
  //               widthRatio: state is SideBarEnabledState ? 1.25 : 1,
  //               child:
  //             );
  //           }),
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hover_extensions.dart';

class HomeSection extends StatefulWidget {
  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: <Widget>[
                Text('Made with '),
                FlutterLogo(
                  size: 15,
                )
              ],
            ),
          ).showCursorOnHover,
        ),
        Center(
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/geek.png',
              height: 500,
              width: 600,
            ),
          ),
        ),
      ],
    );
  }
}

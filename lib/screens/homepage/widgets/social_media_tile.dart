import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hover_extensions.dart';

class SocialMediaTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          tile("linkedin",
              "https://www.linkedin.com/in/nitish-sahani-911193119/"),
          tile("twitter", "https://twitter.com/_nitishsahani_"),
          tile("github", "https://github.com/Nashua354"),
          tile("facebook", "https://www.facebook.com/nitish.sahani.31"),
        ],
      ),
    );
  }

  Widget tile(imageTitle, url) {
    return InkWell(
      onTap: () {
        html.window.open(url, imageTitle);
      },
      child: Container(
        child: Image.asset(
          'assets/images/$imageTitle.png',
          height: 30,
        ),
      ),
    ).showCursorOnHover.moveDownOnHover;
  }
}

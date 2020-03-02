import 'package:flutter/material.dart';

class SocialMediaTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          tile('linkedin'),
          tile('twitter'),
          tile('github'),
          tile('facebook'),
        ],
      ),
    );
  }

  Widget tile(url) {
    return Container(
      child: Image.asset(
        'assets/images/$url.png',
        height: 30,
      ),
    );
  }
}

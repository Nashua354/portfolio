import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/model/poems.dart';

class PoemSectionWidget extends StatelessWidget {
  final Poem poemData;
  PoemSectionWidget({this.poemData});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: ScrollController(initialScrollOffset: 0),
      child: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(
        //       poemData.imageUrl,
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.1,
              child: Image.network(
                poemData.imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(poemData.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 25,
                              fontFamily: 'work_sans')),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30, right: 25, left: 25),
                      child: SelectableText(
                        utf8.decode(base64.decode(poemData.script)),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'work_sans',
                          wordSpacing: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Opacity(
//   opacity: 0.1,
//   child: Image.network(
//     poemData.imageUrl,
//     fit: BoxFit.cover,
//     width: MediaQuery.of(context).size.width,
//     height: MediaQuery.of(context).size.height,
//   ),
// )

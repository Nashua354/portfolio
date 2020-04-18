import 'package:flutter/material.dart';
import 'package:portfolio/model/poems.dart';

class PoemSectionWidget extends StatelessWidget {
  final Poem poemData;
  PoemSectionWidget({this.poemData});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(poemData.title, style: TextStyle(fontSize: 20, fontFamily: 'work_sans')),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, right: 25),
              child: SelectableText(
                poemData.script,
                style: TextStyle(fontSize: 15, fontFamily: 'work_sans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
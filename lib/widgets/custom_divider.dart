import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(-5),
            color: Colors.white,
            spreadRadius: 1,
            blurRadius: 1,
          )
        ],
        color: Color(0xffaaaaaa),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  CenteredView({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(0),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

class PrimaryVerticalLayout extends StatelessWidget {
  final Widget child;
  final double widthRatio;
  final Color backgroundColor;
  const PrimaryVerticalLayout(
      {Key key, this.widthRatio, this.child, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, top: 20, left: 25),
      color: backgroundColor,
      width: MediaQuery.of(context).size.width / widthRatio,
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}

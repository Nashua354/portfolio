import 'package:flutter/material.dart';

class PrimaryVerticalLayout extends StatelessWidget {
  final Widget child;
  final double widthRatio;
  final Color backgroundColor;
  final double leftPadding;

  final double rightPadding;
  final double topPadding;
  final double bottomPadding;
  const PrimaryVerticalLayout(
      {Key key,
      this.widthRatio,
      this.child,
      this.backgroundColor,
      this.leftPadding,
      this.rightPadding,
      this.topPadding,
      this.bottomPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          right: rightPadding ?? 25,
          top: topPadding ?? 20,
          left: leftPadding ?? 25,
          bottom: bottomPadding ?? 0),
      color: backgroundColor,
      width: MediaQuery.of(context).size.width / widthRatio,
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}

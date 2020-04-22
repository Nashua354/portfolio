import 'package:flutter/material.dart';

class ColorTransition extends StatefulWidget {
  final Widget child;
  ColorTransition({Key key, this.child}) : super(key: key);
  @override
  _ColorTransitionState createState() => _ColorTransitionState();
}

class _ColorTransitionState extends State<ColorTransition> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            backgroundBlendMode: _hovering ? BlendMode.saturation : BlendMode.dstIn),
        child: widget.child,
        // transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

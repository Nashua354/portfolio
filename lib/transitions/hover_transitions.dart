import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  final double up;
  final double down;
  final double left;
  final double right;
  // You can also pass the translation in here if you want to
  TranslateOnHover({
    Key key,
    this.child,
    this.up = 0,
    this.left = 0,
    this.right = 0,
    this.down = 0,
  }) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);

  Matrix4 hoverTransform;

  bool _hovering = false;
  @override
  void initState() {
    hoverTransform = Matrix4.identity()
      ..translate(widget.right - widget.left, widget.down - widget.up, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: widget.child,
        transform: _hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

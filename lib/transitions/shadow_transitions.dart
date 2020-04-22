import 'package:flutter/material.dart';

class ShadowTransition extends StatefulWidget {
  final Widget child;
  ShadowTransition({
    Key key,
    this.child,
  }) : super(key: key);
  @override
  _ShadowTransitionState createState() => _ShadowTransitionState();
}

class _ShadowTransitionState extends State<ShadowTransition> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Card(
        elevation: _hovering ? 2 : 0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: _hovering
                  ? [
                      // BoxShadow(
                      //   color: Colors.grey,
                      //   blurRadius: 2,
                      //   spreadRadius: 1,
                      // )
                    ]
                  : []),
          child: widget.child,
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

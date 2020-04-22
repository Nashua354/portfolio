import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/transitions/color_transition.dart';
import 'package:portfolio/transitions/hover_transitions.dart';
import 'package:portfolio/transitions/shadow_transitions.dart';

extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      // When the mouse enters the widget set the cursor to pointer
      onHover: (event) {
        appContainer.style.cursor = 'pointer';
      },
      // When it exits set it back to default
      onExit: (event) {
        appContainer.style.cursor = 'default';
      },
    );
  }

  Widget get removeColorOnHover {
    return ColorTransition(
      child: this,
    );
  }

  Widget get shadowOnHover {
    return ShadowTransition(
      child: this,
    );
  }

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
      up: 10,
    );
  }

  Widget get moveDownOnHover {
    return TranslateOnHover(
      child: this,
      down: 10,
    );
  }

  Widget get moveLeftOnHover {
    return TranslateOnHover(
      child: this,
      left: 10,
    );
  }

  Widget get moveRightOnHover {
    return TranslateOnHover(
      child: this,
      right: 10,
    );
  }
}

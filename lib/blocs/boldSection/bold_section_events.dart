import 'package:flutter/material.dart';
import 'package:portfolio/blocs/base/base_event.dart';

class BoldSectionEvents extends BaseEvent {}

class RenderBoldSectionEvent extends BoldSectionEvents {
  List<Widget> content;
  RenderBoldSectionEvent({@required this.content});
}

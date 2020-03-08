import 'package:flutter/material.dart';
import 'package:portfolio/blocs/base/base_event.dart';

class SecondarySectionEvents extends BaseEvent {}

class RenderSecondarySectionEvent extends SecondarySectionEvents {
  List<Widget> content;
  RenderSecondarySectionEvent({@required this.content});
}

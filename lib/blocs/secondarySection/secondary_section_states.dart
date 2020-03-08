import 'package:flutter/material.dart';
import 'package:portfolio/blocs/base/base_state.dart';

class SecondarySectionStates extends BaseState {}

class RenderSecondarySectionState extends SecondarySectionStates {
  List<Widget> content;
  RenderSecondarySectionState({@required this.content});
}

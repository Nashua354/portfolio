import 'package:flutter/material.dart';
import 'package:portfolio/blocs/base/base_state.dart';

class BoldSectionStates extends BaseState {}

class RenderBoldSectionState extends BoldSectionStates {
  List<Widget> content;
  RenderBoldSectionState({@required this.content});
}

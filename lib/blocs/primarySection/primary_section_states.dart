import 'package:portfolio/blocs/base/base_state.dart';
import 'package:portfolio/model/poems.dart';

class PrimarySectionStates extends BaseState {}

class InitialState extends PrimarySectionStates {}

class PoetryPrimarySectionState extends PrimarySectionStates {
  PoemsParser poemsParser;
  PoetryPrimarySectionState({this.poemsParser});
}

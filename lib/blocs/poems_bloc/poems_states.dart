import 'package:portfolio/blocs/base/base_state.dart';

class PoemsStates extends BaseState {}

class PoemsSuccessState extends PoemsStates {
  String filterTag;
  PoemsSuccessState({this.filterTag});
}

class PoemsLoadingState extends PoemsStates {}

class PoemsFailureState extends PoemsStates {}

class PoemsInitialState extends PoemsStates {}

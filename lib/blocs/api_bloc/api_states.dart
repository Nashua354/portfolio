import 'package:portfolio/blocs/base/base_state.dart';

class ApiStates extends BaseState {}

class ApiSuccessState extends ApiStates {}

class ApiLoadingState extends ApiStates {}

class ApiFailureState extends ApiStates {}

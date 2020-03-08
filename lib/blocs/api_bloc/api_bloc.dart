import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/api_bloc/api_events.dart';
import 'package:portfolio/blocs/api_bloc/api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  @override
  ApiStates get initialState => ApiSuccessState();

  @override
  Stream<ApiStates> mapEventToState(ApiEvents event) async* {
    try {
      if (event is GetPoemsEvent) {}
    } catch (e) {
      print(e);
    }
  }
}

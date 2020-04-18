import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_events.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_states.dart';

class HighLightBloc extends Bloc<HighLightEvents, HighLightStates> {
  @override
  HighLightStates get initialState => DisableHighLightState();

  @override
  Stream<HighLightStates> mapEventToState(HighLightEvents event) async* {
    if (event is EnableHighLightEvent) {
      if (event.toEnable)
        yield EnableHighLightState();
      else
        yield DisableHighLightState();
    }
  }
}

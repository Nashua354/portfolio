import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'isdark_event.dart';
part 'isdark_state.dart';

class IsdarkBloc extends Bloc<IsdarkEvent, IsdarkState> {
  @override
  IsdarkState get initialState => DarkState();

  @override
  Stream<IsdarkState> mapEventToState(IsdarkEvent event) async* {
    if (event is ToggleDarkModeEvent) {
      if (state is DarkState) {
        yield LightState();
      } else if (state is LightState) {
        yield DarkState();
      }
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/primarySection/primary_section_events.dart';
import 'package:portfolio/blocs/primarySection/primary_section_states.dart';

class PrimarySectionBloc
    extends Bloc<PrimarySectionEvents, PrimarySectionStates> {
  @override
  PrimarySectionStates get initialState => InitialState();

  @override
  Stream<PrimarySectionStates> mapEventToState(
      PrimarySectionEvents event) async* {
    try {
      if (event is PoetryPrimarySectionEvent) {
        yield PoetryPrimarySectionState(poemsParser: event.poemsParser);
      }
    } catch (e) {
      throw StateError(e);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_events.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_states.dart';

class SecondarySectionBloc
    extends Bloc<SecondarySectionEvents, SecondarySectionStates> {
  @override
  SecondarySectionStates get initialState => InitialSecondarySectionState();

  @override
  Stream<SecondarySectionStates> mapEventToState(
      SecondarySectionEvents event) async* {
    if (event is RenderSecondarySectionEvent) {
      yield RenderSecondarySectionState(content: event.content);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/boldSection/bold_section_events.dart';
import 'package:portfolio/blocs/boldSection/bold_section_states.dart';

class BoldSectionBloc extends Bloc<BoldSectionEvents, BoldSectionStates> {
  @override
  BoldSectionStates get initialState => RenderBoldSectionState(content: []);

  @override
  Stream<BoldSectionStates> mapEventToState(BoldSectionEvents event) async* {
    if (event is RenderBoldSectionEvent) {
      yield RenderBoldSectionState(content: event.content);
    }
  }
}

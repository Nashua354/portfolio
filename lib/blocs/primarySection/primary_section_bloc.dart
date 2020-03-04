import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/primarySection/primary_section_event.dart';
import 'package:portfolio/blocs/primarySection/primary_section_state.dart';

class PrimarySectionBloc
    extends Bloc<PrimarySectionEvents, PrimarySectionStates> {
  @override
  PrimarySectionStates get initialState => BoldSectionState();

  @override
  Stream<PrimarySectionStates> mapEventToState(
      PrimarySectionEvents event) async* {
    try {
      if (event is BoldSectionEvent) yield BoldSectionState();
      if (event is TwoSectionEvent) yield TwoSectionState();
    } catch (e) {
      throw StateError(e);
    }
  }
}

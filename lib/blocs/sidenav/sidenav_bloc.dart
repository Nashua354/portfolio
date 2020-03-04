import 'package:bloc/bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_events.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';

class SideNavBloc extends Bloc<SideNavEvents, SideNavStates> {
  @override
  SideNavStates get initialState => ShowSideNavState();

  @override
  Stream<SideNavStates> mapEventToState(SideNavEvents event) async* {
    try {
      if (event is HighLightSideNavEvent) {
        yield ShowSideNavState();
      }
    } catch (e) {
      throw StateError(e);
    }
  }
}

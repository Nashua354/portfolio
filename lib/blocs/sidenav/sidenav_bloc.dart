import 'package:bloc/bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_events.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';

class SideNavBloc extends Bloc<SideNavEvents, SideNavStates> {
  @override
  SideNavStates get initialState => SideBarDisabledState();

  @override
  Stream<SideNavStates> mapEventToState(SideNavEvents event) async* {
    try {
      if (event is HighLightSideNavEvent) {
        yield ShowSideNavState();
      }
      if (event is EnableSideBarEvent) yield SideBarEnabledState();
      if (event is DisableSideBarEvent) yield SideBarDisabledState();
    } catch (e) {
      throw StateError(e);
    }
  }
}

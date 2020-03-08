import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_events.dart';
import 'package:portfolio/blocs/homePage/home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  @override
  HomePageStates get initialState => SingleSectionState();

  @override
  Stream<HomePageStates> mapEventToState(HomePageEvents event) async* {
    try {
      if (event is SingleSectionEvent) yield SingleSectionState();
      if (event is TwoSectionEvent) yield TwoSectionState();
    } catch (e) {
      throw StateError(e);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_events.dart';
import 'package:portfolio/blocs/homePage/home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  @override
  HomePageStates get initialState => BoldSectionState();

  @override
  Stream<HomePageStates> mapEventToState(HomePageEvents event) async* {
    try {
      if (event is BoldSectionEvent) yield BoldSectionState();
      if (event is TwoSectionEvent) yield TwoSectionState();
    } catch (e) {
      throw StateError(e);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_events.dart';
import 'package:portfolio/blocs/poems_bloc/poems_states.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/repositories/get_poems_repository.dart';

class PoemsBloc extends Bloc<PoemsEvents, PoemsStates> {
  FilteredPoems filteredPoems = locator<FilteredPoems>();
  SavedData savedData = locator<SavedData>();
  @override
  PoemsStates get initialState => PoemsInitialState();

  @override
  Stream<PoemsStates> mapEventToState(PoemsEvents event) async* {
    try {
      if (event is GetPoemsEvent) {
        yield PoemsLoadingState();
        bool result = await GetPoemsRepository().getPoems();
        if (result) {
          filteredPoems.poems = savedData.poemsParser.poems;
          yield PoemsSuccessState(filterTag: 'all');
        } else
          yield PoemsFailureState();
      }
      if (event is ChangeFilterTag) {
        yield PoemsSuccessState(filterTag: event.filterTag);
        filteredPoems.poems = [];
        if (event.filterTag == 'all') filteredPoems.poems = savedData.poemsParser.poems;

        savedData.poemsParser.poems.forEach((item) {
          if (item.poem.tags.contains(event.filterTag)) {
            filteredPoems.poems.add(item);
          }
        });
      }
    } catch (e) {
      // print(e);
    }
  }
}

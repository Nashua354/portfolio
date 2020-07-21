import 'package:get_it/get_it.dart';
import 'package:portfolio/blocs/poems_bloc/poems_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/model/poems.dart';
import 'package:portfolio/model/saved_data.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SideNavBloc());
  locator.registerLazySingleton(() => PoemsBloc());

  //Parsers
  locator.registerLazySingleton(() => PoemsParser());
  locator.registerLazySingleton(() => SavedData());
  locator.registerLazySingleton(() => FilteredPoems());
}

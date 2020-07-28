import 'package:get_it/get_it.dart';
import 'package:portfolio/blocs/isdark_bloc/isdark_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_bloc.dart';
import 'package:portfolio/blocs/projects_bloc/projects_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/model/saved_data.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SideNavBloc());
  locator.registerLazySingleton(() => PoemsBloc());
  locator.registerLazySingleton(() => ProjectsBloc());
  locator.registerLazySingleton(() => IsdarkBloc());

  //Parsers
  locator.registerLazySingleton(() => SavedData());
  locator.registerLazySingleton(() => FilteredPoems());
  locator.registerLazySingleton(() => FilteredProjects());
}

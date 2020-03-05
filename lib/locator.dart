import 'package:get_it/get_it.dart';
import 'package:portfolio/blocs/homePage/home_page_bloc.dart';
import 'package:portfolio/blocs/primarySection/primary_section_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SideNavBloc());
  locator.registerLazySingleton(() => PrimarySectionBloc());
  locator.registerLazySingleton(() => HomePageBloc());
}

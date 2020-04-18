import 'package:get_it/get_it.dart';
import 'package:portfolio/blocs/boldSection/bold_section_bloc.dart';
import 'package:portfolio/blocs/homePage/home_page_bloc.dart';
import 'package:portfolio/blocs/primarySection/primary_section_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/controllers/primary_section_controller.dart';
import 'package:portfolio/controllers/secondary_section_controller.dart';
import 'package:portfolio/model/poems.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SideNavBloc());
  locator.registerLazySingleton(() => PrimarySectionBloc());
  locator.registerLazySingleton(() => SecondarySectionBloc());
  locator.registerLazySingleton(() => BoldSectionBloc());
  locator.registerLazySingleton(() => HomePageBloc());
  locator.registerLazySingleton(() => PrimarySectionController());
  locator.registerLazySingleton(() => SecondarySectionController());

  //Parsers
  locator.registerLazySingleton(() => PoemsParser());
  locator.registerLazySingleton(() => SavedData());
}

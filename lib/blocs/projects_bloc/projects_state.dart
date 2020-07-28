part of 'projects_bloc.dart';

@immutable
abstract class ProjectsState {}

class ProjectsInitialState extends ProjectsState {}

class ProjectsSuccessState extends ProjectsState {
  final String filterTag;
  ProjectsSuccessState({this.filterTag});
}

class ProjectsLoadingState extends ProjectsState {}

class ProjectsFailureState extends ProjectsState {}

part of 'projects_bloc.dart';

@immutable
abstract class ProjectsEvent {}

class GetProjectsEvent extends ProjectsEvent {}

class ProjectsChangeFilterEvent extends ProjectsEvent {
  String filterTag;
  ProjectsChangeFilterEvent({this.filterTag});
}

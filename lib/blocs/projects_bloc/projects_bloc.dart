import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/repositories/get_projects_repository.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  FilteredProjects filteredProjects = locator<FilteredProjects>();
  SavedData savedData = locator<SavedData>();
  @override
  ProjectsState get initialState => ProjectsInitialState();

  @override
  Stream<ProjectsState> mapEventToState(ProjectsEvent event) async* {
    try {
      if (event is GetProjectsEvent) {
        yield ProjectsLoadingState();
        bool result = await GetProjectsRepository().getProjects();
        if (result) {
          filteredProjects.projects = savedData.projectsParser.projects;
          yield ProjectsSuccessState(filterTag: 'all');
        } else
          yield ProjectsFailureState();
      }
      if (event is ProjectsChangeFilterEvent) {
        yield ProjectsSuccessState(filterTag: event.filterTag);
        filteredProjects.projects = [];
        if (event.filterTag == 'all') filteredProjects.projects = savedData.projectsParser.projects;

        savedData.projectsParser.projects.forEach((item) {
          if (item.project.tags.contains(event.filterTag)) {
            filteredProjects.projects.add(item);
          }
        });
      }
    } catch (e) {
      // print(e);
    }
  }
}

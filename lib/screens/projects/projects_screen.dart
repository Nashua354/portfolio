import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/projects_bloc/projects_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/screens/projects/filters.dart';
import 'package:portfolio/screens/projects/projects_screen_tile.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class ProjectsScreen extends CustomScaffold {
  ProjectsBloc projectsBloc = locator<ProjectsBloc>();
  FilteredProjects filteredProjects = locator<FilteredProjects>();
  SideNavBloc sideNavBloc = locator<SideNavBloc>();
  @override
  Widget body(context) {
    sideNavEnable("PROJECTS");
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Projects",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: 'work_sans',
              ),
            ),
          ),
          ProjectFilters(),
          BlocBuilder(
              bloc: projectsBloc,
              builder: (context, state) {
                if (state is ProjectsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProjectsFailureState)
                  return Text("404");
                else if (state is ProjectsInitialState) {
                  projectsBloc.add(GetProjectsEvent());
                  return Container();
                } else if (state is ProjectsSuccessState) {
                  return Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: sideNavBloc.state is SideBarEnabledState ? 4 : 5,
                        children: List.generate(filteredProjects.projects.length, (index) {
                          return ProjectScreenTile(
                            index: index,
                            key: UniqueKey(),
                          );
                        })),
                  );
                } else
                  return Container();
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/projects_bloc/projects_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/screens/projects/filters.dart';
import 'package:portfolio/screens/projects/project_view_tile.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class ProjectView extends CustomScaffold {
  String title;
  ProjectView({this.title});
  FilteredProjects filteredProjects = locator<FilteredProjects>();
  ProjectsBloc projectsBloc = locator<ProjectsBloc>();

  @override
  Widget body(context) {
    return Container(
      child: BlocBuilder(
          bloc: projectsBloc,
          builder: (context, state) {
            if (state is ProjectsInitialState) {
              projectsBloc.add(GetProjectsEvent());
              filteredProjects.index = 0;
              return Container();
            } else if (state is ProjectsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProjectsFailureState)
              return Text("404");
            else if (state is ProjectsSuccessState)
              return Row(
                children: <Widget>[
                  PrimaryVerticalLayout(
                    backgroundColor: CommonColors.primaryColor,
                    widthRatio: 4,
                    rightPadding: 0,
                    child: Scrollbar(
                      controller: ScrollController(keepScrollOffset: true),
                      child: Stack(
                        children: <Widget>[
                          ProjectFilters(),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredProjects.projects.length,
                                itemBuilder: (context, index) {
                                  return ProjectViewTile(
                                    key: UniqueKey(),
                                    index: index,
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder(
                      bloc: sideNavBloc,
                      builder: (context, sideNavState) {
                        return PrimaryVerticalLayout(
                          backgroundColor: CommonColors.secondaryColor,
                          widthRatio: sideNavState is SideBarEnabledState ? 1.82 : 1.421,
                          rightPadding: 0,
                          leftPadding: 0,
                          topPadding: 0,
                          child: Scrollbar(
                            controller: ScrollController(initialScrollOffset: 0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Card(
                                      child: Image.asset("name"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              );
          }),
    );
  }
}

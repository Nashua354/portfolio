import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/projects_bloc/projects_bloc.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';

class ProjectFilters extends StatelessWidget {
  ProjectsBloc projectsBloc = locator<ProjectsBloc>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(left: 25, top: 20),
        child: BlocBuilder(
            bloc: projectsBloc,
            builder: (context, state) {
              if (state is ProjectsSuccessState)
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          projectsBloc.add(ProjectsChangeFilterEvent(filterTag: 'all'));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: state.filterTag == 'all' ? Colors.blueGrey : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("All"),
                        ),
                      ).showCursorOnHover.shadowOnHover,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          projectsBloc.add(ProjectsChangeFilterEvent(filterTag: 'flutter'));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: state.filterTag == 'flutter' ? Colors.blueGrey : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Flutter"),
                        ),
                      ).showCursorOnHover.shadowOnHover,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          projectsBloc.add(ProjectsChangeFilterEvent(filterTag: 'firebase'));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: state.filterTag == 'firebase' ? Colors.blueGrey : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Firebase"),
                        ),
                      ).showCursorOnHover.shadowOnHover,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          projectsBloc.add(ProjectsChangeFilterEvent(filterTag: 'react'));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: state.filterTag == 'react' ? Colors.blueGrey : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("React"),
                        ),
                      ).showCursorOnHover.shadowOnHover,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: () {
                          projectsBloc.add(ProjectsChangeFilterEvent(filterTag: 'clone'));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: state.filterTag == 'clone' ? Colors.blueGrey : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Clone"),
                        ),
                      ).showCursorOnHover.shadowOnHover,
                    ),
                  ],
                );
              return Container();
            }),
      ),
    );
  }
}

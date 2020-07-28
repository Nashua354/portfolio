import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_events.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_states.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/routing/routing.dart';

class ProjectViewTile extends StatefulWidget {
  final int index;
  final Key key;
  ProjectViewTile({this.index, this.key}) : super(key: key);

  @override
  _ProjectViewTileState createState() => _ProjectViewTileState();
}

class _ProjectViewTileState extends State<ProjectViewTile> {
  HighLightBloc highLighBloc = HighLightBloc();

  FilteredProjects filteredProjects = locator<FilteredProjects>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(savedData.projects[widget.index].project.imageUrl);
    return BlocBuilder(
        bloc: highLighBloc,
        builder: (context, state) {
          highLighBloc
              .add(EnableHighLightEvent(filteredProjects.projects[widget.index].project.isActive));
          return InkWell(
            onTap: () {
              // SecondarySectionController().projectsReset(widget.index);
              if (filteredProjects.index != null)
                filteredProjects.projects[filteredProjects.index].project.isActive = false;
              filteredProjects.index = widget.index;
              filteredProjects.projects[widget.index].project.isActive = true;
              RouteHandler.router.navigateTo(
                  context, "projects/${filteredProjects.projects[widget.index].project.title}");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10, right: 25),
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Card(
                color: state is EnableHighLightState ? Colors.blueGrey : Colors.white,
                child: ListTile(
                  title: Text(
                    "${filteredProjects.projects[widget.index].project.title} ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'work_sans',
                    ),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      Image.network(
                        filteredProjects.projects[widget.index].project.imageUrl,
                        fit: BoxFit.fitHeight,
                        // height: 200,
                      ),
                      Text(
                        formattedDate(filteredProjects.projects[widget.index].project.date),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'work_sans',
                        ),
                      )
                    ],
                  ),
                ),
              ).showCursorOnHover.moveUpOnHover,
            ),
          );
        });
  }

  String formattedDate(Timestamp date) {
    String day = date.toDate().day.toString();
    String month;
    switch (date.toDate().month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      case 12:
        month = 'Dec';
        break;
    }
    String year = date.toDate().year.toString();
    return '  $day, $month, $year  ';
  }
}

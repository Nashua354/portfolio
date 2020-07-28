import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/routing/routing.dart';

class ProjectScreenTile extends StatelessWidget {
  final int index;
  final Key key;
  ProjectScreenTile({this.index, this.key});
  FilteredProjects filteredProjects = locator<FilteredProjects>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10, right: 25),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // SecondarySectionController().poemsReset(index);
          if (filteredProjects.index != null)
            filteredProjects.projects[filteredProjects.index].project.isActive = false;
          filteredProjects.index = index;
          filteredProjects.projects[index].project.isActive = true;
          RouteHandler.router
              .navigateTo(context, "projects/${filteredProjects.projects[index].project.title}");
        },
        child: Card(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide(color: Colors.blueGrey))),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${filteredProjects.projects[index].project.title} ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'work_sans',
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labels("flutter"),
                        labels("react"),
                        labels("firebase"),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                // decoration: BoxDecoration(border: Border.all()),
                child: Image.network(
                  filteredProjects.projects[index].project.imageUrl,
                  fit: BoxFit.cover,
                  height: 193.8,
                ),
              ),
            ],
          ),
        ).showCursorOnHover.moveUpOnHover,
      ),
    );
  }

  Widget labels(String labelName) {
    return filteredProjects.projects[index].project.tags.contains("$labelName")
        ? Image.asset(
            "assets/images/tech/$labelName.png",
            height: 20,
            width: 20,
          )
        : Container();
  }

//filteredPoems.poemsParser.poems[index].poem.title
// formattedDate(filteredPoems.poemsParser.poems[index].poem.date)
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/routing/routing.dart';

class PoemScreenTile extends StatelessWidget {
  final int index;
  final Key key;
  PoemScreenTile({this.index, this.key});
  FilteredPoems filteredPoems = locator<FilteredPoems>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10, right: 25),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // SecondarySectionController().poemsReset(index);
          if (filteredPoems.index != null)
            filteredPoems.poems[filteredPoems.index].poem.isActive = false;
          filteredPoems.index = index;
          filteredPoems.poems[index].poem.isActive = true;
          RouteHandler.router.navigateTo(context, "poems/${filteredPoems.poems[index].poem.title}");
        },
        child: Card(
          child: ListTile(
            title: Text(
              "${filteredPoems.poems[index].poem.title} ",
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
                  filteredPoems.poems[index].poem.imageUrl,
                  fit: BoxFit.cover,
                  height: 190,
                ),
                Text(
                  formattedDate(filteredPoems.poems[index].poem.date),
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

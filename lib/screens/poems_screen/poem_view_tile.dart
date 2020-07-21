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

class PoetryTile extends StatefulWidget {
  final int index;
  final Key key;
  PoetryTile({this.index, this.key}) : super(key: key);

  @override
  _PoetryTileState createState() => _PoetryTileState();
}

class _PoetryTileState extends State<PoetryTile> {
  HighLightBloc highLighBloc = HighLightBloc();

  FilteredPoems filteredPoems = locator<FilteredPoems>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(savedData.poems[widget.index].poem.imageUrl);
    return BlocBuilder(
        bloc: highLighBloc,
        builder: (context, state) {
          highLighBloc.add(EnableHighLightEvent(filteredPoems.poems[widget.index].poem.isActive));
          return InkWell(
            onTap: () {
              // SecondarySectionController().poemsReset(widget.index);
              if (filteredPoems.index != null)
                filteredPoems.poems[filteredPoems.index].poem.isActive = false;
              filteredPoems.index = widget.index;
              filteredPoems.poems[widget.index].poem.isActive = true;
              RouteHandler.router
                  .navigateTo(context, "poems/${filteredPoems.poems[widget.index].poem.title}");
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
                    "${filteredPoems.poems[widget.index].poem.title} ",
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
                        filteredPoems.poems[widget.index].poem.imageUrl,
                        fit: BoxFit.fitHeight,
                        // height: 200,
                      ),
                      Text(
                        formattedDate(filteredPoems.poems[widget.index].poem.date),
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

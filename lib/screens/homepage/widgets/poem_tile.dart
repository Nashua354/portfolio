import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_bloc.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_events.dart';
import 'package:portfolio/blocs/highlightBloc/highlight_states.dart';
import 'package:portfolio/controllers/primary_section_controller.dart';
import 'package:portfolio/controllers/secondary_section_controller.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';

class PoetryTile extends StatefulWidget {
  final Function onTap;
  final int index;
  final Key key;
  PoetryTile({this.onTap, this.index, this.key}) : super(key: key);

  @override
  _PoetryTileState createState() => _PoetryTileState();
}

class _PoetryTileState extends State<PoetryTile> {
  HighLightBloc highLighBloc = HighLightBloc();

  PrimarySectionController primarySectionController = locator<PrimarySectionController>();

  SavedData savedData = locator<SavedData>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(savedData.poemsParser.poems[widget.index].poem.imageUrl);
    return BlocBuilder(
        bloc: highLighBloc,
        builder: (context, state) {
          highLighBloc
              .add(EnableHighLightEvent(savedData.poemsParser.poems[widget.index].poem.isActive));
          return InkWell(
            onTap: () {
              SecondarySectionController().poemsReset(widget.index);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 10, right: 25),
              width: MediaQuery.of(context).size.width,
              color: state is EnableHighLightState ? Colors.red : Colors.transparent,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    child: FadeInImage(
                        fit: BoxFit.fitHeight,
                        width: 350,
                        placeholder: AssetImage('assets/images/loading.gif'),
                        image: NetworkImage(
                          savedData.poemsParser.poems[widget.index].poem.imageUrl,
                        )),
                  ),
                  Positioned(
                    top: -10,
                    left: -10,
                    child: Text(
                      "  ${savedData.poemsParser.poems[widget.index].poem.title}  ",
                      style: TextStyle(
                        height: 2,
                        backgroundColor: Colors.red,
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'work_sans',
                      ),
                    ),
                  ),
                  Positioned(
                    right: -10,
                    bottom: -10,
                    child: Text(
                      formattedDate(savedData.poemsParser.poems[widget.index].poem.date),
                      style: TextStyle(
                        height: 2,
                        backgroundColor: Colors.red,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
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

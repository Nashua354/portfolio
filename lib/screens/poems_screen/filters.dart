import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_events.dart';
import 'package:portfolio/blocs/poems_bloc/poems_states.dart';
import 'package:portfolio/extensions/hover_extensions.dart';
import 'package:portfolio/locator.dart';

class PoemFilters extends StatelessWidget {
  PoemsBloc poemsBloc = locator<PoemsBloc>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 20),
      child: BlocBuilder(
          bloc: poemsBloc,
          builder: (context, state) {
            if (state is PoemsSuccessState)
              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        poemsBloc.add(ChangeFilterTag(filterTag: 'all'));
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
                        poemsBloc.add(ChangeFilterTag(filterTag: 'english'));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: state.filterTag == 'english' ? Colors.blueGrey : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("English"),
                      ),
                    ).showCursorOnHover.shadowOnHover,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        poemsBloc.add(ChangeFilterTag(filterTag: 'hindi'));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: state.filterTag == 'hindi' ? Colors.blueGrey : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Hindi"),
                      ),
                    ).showCursorOnHover.shadowOnHover,
                  )
                ],
              );
            return Container();
          }),
    );
  }
}

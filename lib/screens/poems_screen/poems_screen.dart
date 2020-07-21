import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_events.dart';
import 'package:portfolio/blocs/poems_bloc/poems_states.dart';
import 'package:portfolio/blocs/sidenav/sidenav_bloc.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/screens/poems_screen/filters.dart';
import 'package:portfolio/screens/poems_screen/poems_screen_tile.dart';
import 'package:portfolio/widgets/sidenav/side_nav_data.dart';

class PoemsScreen extends CustomScaffold {
  PoemsBloc poemsBloc = locator<PoemsBloc>();
  FilteredPoems filteredPoems = locator<FilteredPoems>();
  SideNavBloc sideNavBloc = locator<SideNavBloc>();
  @override
  Widget body(context) {
    sideNavEnable("POETRY");
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      child: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Poems",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: 'work_sans',
                ),
              )),
          PoemFilters(),
          BlocBuilder(
              bloc: poemsBloc,
              builder: (context, state) {
                if (state is PoemsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is PoemsFailureState)
                  return Text("404");
                else if (state is PoemsInitialState) {
                  poemsBloc.add(GetPoemsEvent());
                  return Container();
                } else if (state is PoemsSuccessState) {
                  return Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: sideNavBloc.state is SideBarEnabledState ? 4 : 5,
                        children: List.generate(filteredPoems.poems.length, (index) {
                          return PoemScreenTile(
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

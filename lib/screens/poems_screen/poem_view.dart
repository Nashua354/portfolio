import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_bloc.dart';
import 'package:portfolio/blocs/poems_bloc/poems_events.dart';
import 'package:portfolio/blocs/poems_bloc/poems_states.dart';
import 'package:portfolio/blocs/sidenav/sidenav_states.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';
import 'package:portfolio/screens/main_scaffold.dart';
import 'package:portfolio/screens/poems_screen/filters.dart';
import 'package:portfolio/screens/poems_screen/poem_view_tile.dart';
import 'package:portfolio/widgets/primary_vertical_layout.dart';

class PoemView extends CustomScaffold {
  String title;
  PoemView({this.title});
  FilteredPoems filteredPoems = locator<FilteredPoems>();
  PoemsBloc poemsBloc = locator<PoemsBloc>();

  @override
  Widget body(context) {
    return Container(
      child: BlocBuilder(
          bloc: poemsBloc,
          builder: (context, state) {
            if (state is PoemsInitialState) {
              poemsBloc.add(GetPoemsEvent());
              filteredPoems.index = 0;
              return Container();
            } else if (state is PoemsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PoemsFailureState)
              return Text("404");
            else if (state is PoemsSuccessState)
              return Row(
                children: <Widget>[
                  PrimaryVerticalLayout(
                    backgroundColor: CommonColors.primarySection,
                    widthRatio: 4,
                    rightPadding: 0,
                    child: Scrollbar(
                      controller: ScrollController(keepScrollOffset: true),
                      child: Stack(
                        children: <Widget>[
                          PoemFilters(),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredPoems.poems.length,
                                itemBuilder: (context, index) {
                                  return PoetryTile(
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
                          backgroundColor: CommonColors.secondarySection,
                          widthRatio: sideNavState is SideBarEnabledState ? 1.82 : 1.421,
                          rightPadding: 0,
                          leftPadding: 0,
                          topPadding: 0,
                          child: Scrollbar(
                            controller: ScrollController(initialScrollOffset: 0),
                            child: Stack(
                              children: <Widget>[
                                Opacity(
                                  opacity: 0.1,
                                  child: Image.network(
                                    filteredPoems.poems[filteredPoems.index].poem.imageUrl,
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 30),
                                          child: Text(
                                              filteredPoems.poems[filteredPoems.index].poem.title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontSize: 25,
                                                  fontFamily: 'work_sans')),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(bottom: 30, right: 25, left: 25),
                                          child: SelectableText(
                                            utf8.decode(base64.decode(filteredPoems
                                                .poems[filteredPoems.index].poem.script)),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontFamily: 'work_sans',
                                              wordSpacing: 5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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

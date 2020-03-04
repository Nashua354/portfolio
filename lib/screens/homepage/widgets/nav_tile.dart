import 'package:flutter/material.dart';
import 'package:portfolio/blocs/primarySection/primary_section_bloc.dart';
import 'package:portfolio/blocs/primarySection/primary_section_event.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/widgets/custom_divider.dart';

class NavItem extends StatelessWidget {
  final Widget navItem;
  NavItem({this.navItem});
  PrimarySectionBloc test = locator<PrimarySectionBloc>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        // print("color changed");
      },
      onTap: () {
        if (navItem is Text) {
          print("TEXT");
          test.add(TwoSectionEvent());
        } else {
          print("OTHERS");
          test.add(BoldSectionEvent());
        }
      },
      child: Column(
        children: <Widget>[
          CustomDivider(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: navItem,
          ),
        ],
      ),
    );
  }
}

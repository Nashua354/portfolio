import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_divider.dart';

class NavItem extends StatelessWidget {
  final Widget navItem;
  NavItem({this.navItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        // print("color changed");
      },
      onTap: () {
        print('done ');
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

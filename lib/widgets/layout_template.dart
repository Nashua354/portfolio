import 'package:flutter/material.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/routing/route_names.dart';
import 'package:portfolio/routing/router.dart';
import 'package:portfolio/services/navigation_service.dart';
import 'package:portfolio/widgets/centered_view.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: generateRoute,
          initialRoute: HomeRoute,
        ),
      ),
    );
  }
}

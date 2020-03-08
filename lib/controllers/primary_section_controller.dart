import 'package:flutter/material.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_events.dart';
import 'package:portfolio/locator.dart';

class PrimarySectionController {
  SecondarySectionBloc secondarySectionBloc = locator<SecondarySectionBloc>();

  renderSecondarySection(List<Widget> content) {
    secondarySectionBloc.add(RenderSecondarySectionEvent(content: content));
  }

  void dispose() {
    secondarySectionBloc.close();
  }
}

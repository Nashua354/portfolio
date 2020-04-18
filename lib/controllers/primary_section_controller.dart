import 'package:flutter/material.dart';
import 'package:portfolio/blocs/primarySection/primary_section_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_bloc.dart';
import 'package:portfolio/blocs/secondarySection/secondary_section_events.dart';
import 'package:portfolio/locator.dart';

class PrimarySectionController {
  PrimarySectionBloc primarySectionBloc = locator<PrimarySectionBloc>();
  SecondarySectionBloc secondarySectionBloc = locator<SecondarySectionBloc>();

  renderSecondarySection(Widget content) {
    secondarySectionBloc.add(RenderSecondarySectionEvent(content: content));
  }

  void dispose() {
    secondarySectionBloc.close();
    primarySectionBloc.close();
  }
}

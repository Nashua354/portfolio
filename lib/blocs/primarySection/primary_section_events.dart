import 'package:portfolio/blocs/base/base_event.dart';
import 'package:portfolio/model/poems.dart';

class PrimarySectionEvents extends BaseEvent {}

class PoetryPrimarySectionEvent extends PrimarySectionEvents {
  PoemsParser poemsParser;
  PoetryPrimarySectionEvent({this.poemsParser});
}

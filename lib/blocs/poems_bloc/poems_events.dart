import 'package:portfolio/blocs/base/base_event.dart';

class PoemsEvents extends BaseEvent {}

class GetPoemsEvent extends PoemsEvents {}

class ChangeFilterTag extends PoemsEvents {
  String filterTag;
  ChangeFilterTag({this.filterTag});
}

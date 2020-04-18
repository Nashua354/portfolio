import 'package:portfolio/blocs/base/base_event.dart';

class HighLightEvents extends BaseEvent {}

class EnableHighLightEvent extends HighLightEvents {
  bool toEnable;
  EnableHighLightEvent(this.toEnable);
}

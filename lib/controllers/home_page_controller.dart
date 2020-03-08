import 'package:portfolio/repositories/get_poems_repository.dart';

class HomePageController {
  initiate() {
    GetPoemsRepository().getPoems();
  }
}

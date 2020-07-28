import 'package:portfolio/model/poems.dart';
import 'package:portfolio/model/projects.dart';

class SavedData {
  PoemsParser poemsParser;
  ProjectsParser projectsParser;
}

class FilteredPoems {
  List<Snap> poems;
  int index;
}

class FilteredProjects {
  List<ProjectSnap> projects;
  int index;
}

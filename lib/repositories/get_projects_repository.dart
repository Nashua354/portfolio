import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/projects.dart';
import 'package:portfolio/model/saved_data.dart';

class GetProjectsRepository {
  SavedData savedData = locator<SavedData>();
  Future<bool> getProjects() async {
    QuerySnapshot data = await Firestore.instance.collection('projects').getDocuments();
    savedData.projectsParser = ProjectsParser.fromJson(data.documents);
    savedData.projectsParser.projects
        .sort((a, b) => -a.project.date.toDate().compareTo(b.project.date.toDate()));
    if (savedData.projectsParser.projects.isNotEmpty)
      return true;
    else
      return false;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsParser {
  List<ProjectSnap> projects;
  ProjectsParser({this.projects});

  factory ProjectsParser.fromJson(List<DocumentSnapshot> data) => ProjectsParser(
        projects:
            data != null ? List<ProjectSnap>.from(data.map((x) => ProjectSnap.fromJson(x))) : null,
      );
}

class ProjectSnap {
  String documentID;
  Project project;
  bool exists;
  ProjectSnap({this.documentID, this.project, this.exists});
  factory ProjectSnap.fromJson(DocumentSnapshot data) {
    return ProjectSnap(
      documentID: data.documentID,
      project: Project.fromJson(data.data),
      exists: data.exists,
    );
  }
}

class Project {
  String title;
  String description;
  String githubLink;
  String demoLink;
  String imageUrl;
  Timestamp date;
  bool isActive;
  bool onGoing;
  List<String> tags;
  Project(
      {this.description,
      this.date,
      this.title,
      this.imageUrl,
      this.isActive,
      this.tags,
      this.demoLink,
      this.onGoing,
      this.githubLink});
  factory Project.fromJson(Map<String, dynamic> data) {
    return Project(
      title: data["title"] != null ? data["title"] : "",
      description: data["description"] != null ? data["description"] : "",
      imageUrl: data["imageUrl"] != null ? data["imageUrl"] : "",
      date: data["time"] != null ? data["time"] : Timestamp.now(),
      isActive: false,
      tags: data["tags"] != null ? data["tags"].cast<String>() : [],
      onGoing: data["onGoing"] != null ? data["onGoing"] : true,
      demoLink: data["demoLink"] != null ? data["demoLink"] : "",
      githubLink: data["githubLink"] != null ? data["githubLink"] : '',
    );
  }
}

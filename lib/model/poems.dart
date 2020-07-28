import 'package:cloud_firestore/cloud_firestore.dart';

class PoemsParser {
  List<Snap> poems;
  PoemsParser({this.poems});

  factory PoemsParser.fromJson(List<DocumentSnapshot> data) => PoemsParser(
        poems: data != null ? List<Snap>.from(data.map((x) => Snap.fromJson(x))) : null,
      );
}

class Snap {
  String documentID;
  Poem poem;
  bool exists;
  DocumentReference documentReference;
  Snap({this.documentID, this.poem, this.exists, this.documentReference});
  factory Snap.fromJson(DocumentSnapshot data) {
    return Snap(
      documentID: data.documentID,
      poem: Poem.fromJson(data.data),
      exists: data.exists,
      documentReference: data.reference,
    );
  }
}

class Poem {
  String title;
  String script;
  String imageUrl;
  Timestamp date;
  bool isActive;
  List<String> tags;
  int views;
  Poem({this.script, this.date, this.title, this.imageUrl, this.isActive, this.tags, this.views});
  factory Poem.fromJson(Map<String, dynamic> data) {
    return Poem(
      title: data["title"] != null ? data["title"] : "",
      script: data["script"] != null ? data["script"] : "",
      imageUrl: data["imageUrl"] != null ? data["imageUrl"] : "",
      date: data["time"] != null ? data["time"] : Timestamp.now(),
      isActive: false,
      tags: data["tags"] != null ? data["tags"].cast<String>() : [],
      views: data["views"] != null ? data["views"] : 0,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class PoemsParser {
  List<Snap> poems;
  PoemsParser({
    this.poems,
  });

  factory PoemsParser.fromJson(List<DocumentSnapshot> data) => PoemsParser(
        poems: data != null
            ? List<Snap>.from(data.map((x) => Snap.fromJson(x)))
            : null,
      );
}

class Snap {
  String documentID;
  Poem poem;
  bool exists;
  Snap({this.documentID, this.poem, this.exists});
  factory Snap.fromJson(DocumentSnapshot data) {
    return Snap(
      documentID: data.documentID,
      poem: Poem.fromJson(data.data),
      exists: data.exists,
    );
  }
}

class Poem {
  String title;
  String script;
  String imageUrl;
  Timestamp date;
  Poem({this.script, this.date, this.title, this.imageUrl});
  factory Poem.fromJson(Map<String, dynamic> data) {
    return Poem(
      title: data["title"] != null ? data["title"] : "",
      script: data["script"] != null ? data["script"] : "",
      imageUrl: data["imageUrl"] != null ? data["imageUrl"] : "",
      date: data["time"] != null ? data["time"] : Timestamp.now(),
    );
  }
}

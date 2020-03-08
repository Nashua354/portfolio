import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/poems.dart';

class GetPoemsRepository {
  PoemsParser poemsParser = locator<PoemsParser>();
  getPoems() {
    Firestore.instance.collection('poems').getDocuments().then((data) {
      poemsParser = PoemsParser.fromJson(data.documents);
    });
  }
}

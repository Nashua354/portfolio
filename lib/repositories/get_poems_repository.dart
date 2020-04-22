import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/poems.dart';
import 'package:portfolio/model/saved_data.dart';

class GetPoemsRepository {
  SavedData savedData = locator<SavedData>();
  getPoems() {
    Firestore.instance.collection('poems').getDocuments().then((data) {
      savedData.poemsParser = PoemsParser.fromJson(data.documents);
      savedData.poemsParser.poems
          .sort((a, b) => -a.poem.date.toDate().compareTo(b.poem.date.toDate()));
    });
  }
}

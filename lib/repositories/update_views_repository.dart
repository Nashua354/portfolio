import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/model/saved_data.dart';

class UpdateViewsRepository {
  SavedData savedData = locator<SavedData>();
  FilteredPoems filteredPoems = locator<FilteredPoems>();
  updatePoemViews(DocumentReference docRef) {
    docRef.setData({"views": filteredPoems.poems[filteredPoems.index].poem.views + 1},
        merge: true).then((value) => print("views incremented"));
  }
}

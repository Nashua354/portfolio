import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/api_bloc/api_events.dart';
import 'package:portfolio/blocs/api_bloc/api_states.dart';

class ApiBloc extends Bloc<ApiEvents, ApiStates> {
  @override
  ApiStates get initialState => ApiSuccessState();

  @override
  Stream<ApiStates> mapEventToState(ApiEvents event) async* {
    try {
      if (event is GetPoemsEvent) {
        Firestore.instance.collection('poems').getDocuments().then((data) {
          print(data.documents[0].data["title"]);
          print(data.documents[0].documentID);
        });
      }
    } catch (e) {
      print(e);
    }
  }
}

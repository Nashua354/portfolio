import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  @override
  ArticlesState get initialState => ArticlesInitialState();

  @override
  Stream<ArticlesState> mapEventToState(ArticlesEvent event) async* {}
}

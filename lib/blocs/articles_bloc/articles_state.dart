part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitialState extends ArticlesState {}

class ArticlesSuccessState extends ArticlesState {
  final String filterTag;
  ArticlesSuccessState({this.filterTag});
}

class ArticlesLoadingState extends ArticlesState {}

class ArticlesFailureState extends ArticlesState {}

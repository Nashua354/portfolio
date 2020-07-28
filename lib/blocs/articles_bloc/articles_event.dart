part of 'articles_bloc.dart';

@immutable
abstract class ArticlesEvent {}

class GetArticlesEvent extends ArticlesEvent {}

class ArticlesChangeFilterEvent extends ArticlesEvent {}

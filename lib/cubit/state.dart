import 'package:flutter_application/models/tweets_model.dart';

//!Общий лист
abstract class TweetsState {}

class TweetsLoadingState extends TweetsState {}

class TweetsLoadedState extends TweetsState {
  List<TweetsModel> loaded;
  TweetsLoadedState({required this.loaded});
}

class TweetsErrorState extends TweetsState {}

//!Обработка лайка
abstract class TweetLikeState {}

class TweetPutLikeState extends TweetLikeState {
  int id;
  String like;
  TweetPutLikeState({required this.id, required this.like});
}

class TweetsEmptyState extends TweetLikeState {}

//!Нижняя панель
abstract class SmilesPanelState {}

class SmilesPanelOpenState extends SmilesPanelState {
  int id;
  SmilesPanelOpenState({required this.id});
}

class SmilesPanelClosedState extends SmilesPanelState {}

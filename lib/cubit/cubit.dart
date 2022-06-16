import 'package:flutter_application/boxes.dart';
import 'package:flutter_application/cubit/repository.dart';
import 'package:flutter_application/cubit/state.dart';
import 'package:flutter_application/models/tweets_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

//!Общий лист
class TweetsCubit extends Cubit<TweetsState> {
  final TweetsRepository tweetsRepository;
  TweetsCubit(this.tweetsRepository) : super(TweetsLoadingState());
  Future<void> loadTweets() async {
    try {
      emit(TweetsLoadingState());
      List<TweetsModel> loaded = await tweetsRepository.getLocalTweets();
      emit(TweetsLoadedState(loaded: loaded));
    } catch (_) {
      emit(TweetsErrorState());
    }
  }
}

//!Обработка лайка
class TweetLikeCubit extends Cubit<TweetLikeState> {
  TweetLikeCubit() : super(TweetsEmptyState());
  Future<void> like(int id, String smile) async {
    Box<TweetsModel> box = Boxes.tweetsBox;
    TweetsModel? tweet = box.getAt(id);
    box.putAt(
        id, TweetsModel(name: tweet!.name, text: tweet.text, smiles: smile));
    emit(TweetPutLikeState(id: id, like: smile));
    emit(TweetsEmptyState());
  }
}

//!Панель смайлов
class SmilesPanelCubit extends Cubit<SmilesPanelState> {
  SmilesPanelCubit() : super(SmilesPanelClosedState());

  Future<void> open(int id) async {
    if (state is SmilesPanelOpenState) emit(SmilesPanelClosedState());
    emit(SmilesPanelOpenState(id: id));
  }

  Future<void> hide() async {
    if (state is SmilesPanelClosedState) return;
    emit(SmilesPanelClosedState());
  }
}

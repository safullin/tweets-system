import 'package:flutter_application/models/tweets_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';

class TweetsRepository {
  Future<List<TweetsModel>> getLocalTweets() async {
    List<TweetsModel> listTweets = [];
    List<TweetsModel> tweetsList = Boxes.tweetsBox.values.toList();
    //! На случайн если в базе нет твитов
    if (tweetsList.isEmpty) {
      Boxes.tweetsBox.addAll(newList);
      listTweets = newList;
    } else {
      listTweets = tweetsList;
    }

    return listTweets;
  }
}

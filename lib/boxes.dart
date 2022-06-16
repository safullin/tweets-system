import 'package:hive/hive.dart';
import 'models/tweets_model.dart';

class Boxes {
  static final tweetsBox = Hive.box<TweetsModel>("tweetsList");
}

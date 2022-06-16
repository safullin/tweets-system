import 'package:flutter_application/cubit/cubit.dart';
import 'package:flutter_application/cubit/repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
final tweetsRepository = TweetsRepository();
Future<void> init() async {
  sl.registerFactory(() => TweetsCubit(tweetsRepository));
  sl.registerFactory(() => TweetLikeCubit());
  sl.registerFactory(() => SmilesPanelCubit());
}

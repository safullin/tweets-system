import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/cubit.dart';
import 'package:flutter_application/models/tweets_model.dart';
import 'package:flutter_application/screens/tweets_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application/cubit/locator_services.dart' as servic;
import 'cubit/locator_services.dart';
import 'widgets/smiles_panel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await servic.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TweetsModelAdapter());
  await Hive.openBox<TweetsModel>('tweetsList');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TweetsCubit>(
              create: (context) => sl<TweetsCubit>()..loadTweets()),
          BlocProvider<TweetLikeCubit>(
              create: (context) => sl<TweetLikeCubit>()),
          BlocProvider<SmilesPanelCubit>(
              create: (context) => sl<SmilesPanelCubit>()),
        ],
        child: MaterialApp(
          title: 'Flutter Test App',
          home: Stack(
            children: [TweetsPage(), SmilesPanel()],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/boxes.dart';
import 'package:flutter_application/cubit/cubit.dart';
import 'package:flutter_application/cubit/state.dart';
import 'package:flutter_application/models/tweets_model.dart';
import 'package:flutter_application/widgets/tweet_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TweetsPage extends StatelessWidget {
  const TweetsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TweetsCubit, TweetsState>(builder: (context, state) {
      if (state is TweetsLoadingState) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is TweetsErrorState) {
        return const Center(child: Text("Ошибочка"));
      }

      if (state is TweetsLoadedState) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ValueListenableBuilder<Box>(
                    valueListenable: Boxes.tweetsBox.listenable(),
                    builder: (context, box, widget) {
                      int icount = 0;
                      for (int i = 0;
                          i < box.values.toList().cast<TweetsModel>().length;
                          i++) {
                        if (box.values.toList().cast<TweetsModel>()[i].smiles !=
                                null &&
                            box.values.toList().cast<TweetsModel>()[i].smiles !=
                                "") {
                          icount++;
                        }
                      }

                      return Text('Сколько твитов имеют лайки: $icount');
                    }),
                SizedBox(height: 8),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.loaded.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: TweetCard(id: index, date: state.loaded[index]),
                      );
                    })
              ],
            ),
          ),
        );
      }
      return const Center(child: Text("Ошибочка"));
    }));
  }
}

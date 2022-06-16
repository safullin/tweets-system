import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/cubit/cubit.dart';
import 'package:flutter_application/cubit/state.dart';
import 'package:flutter_application/models/tweets_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TweetCard extends StatefulWidget {
  int id;
  TweetsModel date;
  TweetCard({required this.id, required this.date});

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  @override
  Widget build(BuildContext context) {
    context.read<TweetLikeCubit>().stream.listen((state) {
      if (state is TweetPutLikeState) {
        if (widget.id == state.id) {
          setState(() {
            widget.date.smiles = state.like;
          });
        }
      }
    });

    return GestureDetector(
      onTap: () {
        context.read<SmilesPanelCubit>().open(widget.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10, // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.date.name),
                      SizedBox(height: 8),
                      Text(widget.date.text)
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  context.read<TweetLikeCubit>().like(widget.id, "");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.date.smiles,
                        style: TextStyle(fontSize: 22),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

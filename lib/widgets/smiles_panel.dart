import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/cubit/cubit.dart';
import 'package:flutter_application/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final PanelController panelController = PanelController();

class SmilesPanel extends StatefulWidget {
  const SmilesPanel({Key? key}) : super(key: key);
  @override
  State<SmilesPanel> createState() => _SmilesPanelState();
}

class _SmilesPanelState extends State<SmilesPanel> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    context.read<SmilesPanelCubit>().stream.listen((state) {
      if (state is SmilesPanelOpenState) {
        setState(() {
          id = state.id;
        });
        panelController.open();
      } else if (state is SmilesPanelClosedState) {
        panelController.close();
      }
    });

    return SlidingUpPanel(
        maxHeight: 80,
        minHeight: 0,
        controller: panelController,
        backdropEnabled: true,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        panel: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              smile(id, "👍", context),
              smile(id, "👎", context),
              smile(id, "😍", context),
              smile(id, "❤️", context)
            ],
          ),
        ));
  }
}

Widget smile(int id, String smile, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.read<TweetLikeCubit>().like(id, smile);
      context.read<SmilesPanelCubit>().hide();
    },
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        smile,
        style: const TextStyle(fontSize: 32),
      ),
    ),
  );
}

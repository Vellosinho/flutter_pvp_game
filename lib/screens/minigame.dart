import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_gbb_demo/screens/pause_screens/overlay_screen.dart';
import 'package:provider/provider.dart';

import '../game/game_controller.dart';

class MiniGame extends StatelessWidget {
  static const overlayKey = 'minigameOverlay';
  const MiniGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalGameController>(
      builder: (context, localGameController, _) => Scaffold(
      backgroundColor:Colors.red[900]!.withAlpha(0),
      body: localGameController.minigameIsActive ? Center(
        child: 
        SizedBox(
          width: 320,
          height: 480,
          child: Column(
            children: [
              Stack(
                children: [
                  Row(children: [
                    Portion(boxColor: Colors.red),
                    Portion(boxColor: Colors.red),
                    Portion(boxColor: Colors.red),
                    Portion(boxColor: Colors.red),
                    Portion(boxColor: Colors.red),
                    ],),
                  Positioned(left: 158 - (158 * sin(localGameController.timeCount)),child: SizedBox(height: 64, width: 4, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black),)))
                ],
              ),
              ],
            ),
          )
        ) : const SizedBox(),
      ),
    );
  }
}

class Portion extends StatelessWidget {
  final Color boxColor;
  const Portion({super.key, required this.boxColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: DecoratedBox(decoration: BoxDecoration(color: boxColor)),
    );
  }
}
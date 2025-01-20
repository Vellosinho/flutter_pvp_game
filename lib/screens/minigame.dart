import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:projeto_gbb_demo/screens/pause_screens/overlay_screen.dart';
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
                    Portion(boxColor: Colors.red[800], boxWidth: 106,),
                    Portion(boxColor: Colors.orange[800],boxWidth: 34),
                    Portion(boxColor: Colors.yellow[800], boxWidth: 16),
                    Portion(boxColor: Colors.green[400], boxWidth: 8),
                    Portion(boxColor: Colors.yellow[800], boxWidth: 16),
                    Portion(boxColor: Colors.orange[900], boxWidth: 34),
                    Portion(boxColor: Colors.red[900], boxWidth: 106,),
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
  final double boxWidth;
  final Color? boxColor;
  const Portion({super.key, required this.boxColor, required this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: boxWidth,
      child: DecoratedBox(decoration: BoxDecoration(color: boxColor)),
    );
  }
}
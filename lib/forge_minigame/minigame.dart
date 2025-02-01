import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_gbb_demo/common/common.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:projeto_gbb_demo/screens/pause_screens/overlay_screen.dart';
import 'package:provider/provider.dart';

import '../game/controller/game_controller.dart';

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
          SizedBox(height: 400, width: 480, child: Padding(
            padding: const EdgeInsets.only(right: 80),
            child: Stack(
              children: [
                MinigameInterface.minigameBackground,
                Center(child: Transform.rotate(angle: 90 + sin(localGameController.timeCount),child: SizedBox(height: 320, width: 4, child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height:80, width: 4, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black),)),
                  ],
                )))),
                MinigameInterface.minigameDecoration,
              ],
                        //   ),
                        ),
          )),
        ) : const SizedBox(),
      ),
    );
  }
}
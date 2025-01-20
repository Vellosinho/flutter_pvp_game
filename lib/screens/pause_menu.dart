import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:provider/provider.dart';

import '../game/game_sprite_sheet.dart';

class PauseMenu extends StatelessWidget {
  static const overlayKey = 'pauseMenu';
  const PauseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalGameController>(
      builder: (context, localGameController, _) =>Scaffold(
        backgroundColor: Colors.red[900]!.withAlpha(0),
        body: localGameController.gameIsPaused ? Center(child: SizedBox(height: 1200, width: 1200, child: FittedBox(child: InterfaceSpriteSheet.menuScreenNoLabels))): const SizedBox()),
    );
  }
}

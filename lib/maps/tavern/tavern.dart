import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/lit_player.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/common/common.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/maps/tavern/components/exit_mat.dart';
import 'package:projeto_gbb_demo/maps/town.dart';
import 'package:projeto_gbb_demo/screens/pause_menu.dart';

class TavernMap extends StatelessWidget {
  final LitPlayer player;
  final LocalGameController controller;
  final Function exitFunction;
  const TavernMap(
      {super.key,
      required this.player,
      required this.exitFunction,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    double tileSize = 192;
    void exitToTown() {
      player.position = Vector2(tileSize * 8, tileSize * 7);
      controller.toggleResetCollision();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => TownMap(
            player: player,
            controller: controller,
          ),
          transitionDuration: Duration(milliseconds: 1),
          reverseTransitionDuration: Duration(milliseconds: 1),
        ),
      );
    }

    return BonfireWidget(
      backgroundColor: Color(0xff000000),
      playerControllers: [
        Keyboard(
            config: KeyboardConfig(acceptedKeys: [
          LogicalKeyboardKey.arrowDown,
          LogicalKeyboardKey.arrowLeft,
          LogicalKeyboardKey.arrowUp,
          LogicalKeyboardKey.arrowRight,
          LogicalKeyboardKey.keyZ,
          LogicalKeyboardKey.keyX,
          LogicalKeyboardKey.keyC,
          LogicalKeyboardKey.escape,
        ]))
      ],
      map: WorldMapByTiled(
        WorldMapReader.fromAsset(
            'map/house_interior/yellow_house/yellow_house_map.json'),
        forceTileSize: Vector2(tileSize, tileSize),
      ),
      lightingColorGame: Colors.orange[400]!.withAlpha(48),
      components: [
        ExitMat(
            exitFunction: exitToTown,
            position: Vector2(tileSize * 2, tileSize * 9))
      ],
      cameraConfig: CameraConfig(zoom: 0.8, moveOnlyMapArea: true),
      player: player,
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game, characterClass: playerOneClass),
        PauseMenu.overlayKey: (context, game) => PauseMenu(),
        MiniGame.overlayKey: (context, game) => MiniGame(),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
        PauseMenu.overlayKey,
        MiniGame.overlayKey,
      ],
    );
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/lit_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs.dart';
import 'package:projeto_gbb_demo/game/objects/daytime_clock.dart';
import 'package:projeto_gbb_demo/game/objects/objects.dart';
import 'package:projeto_gbb_demo/game/objects/plants/wheat_field.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:projeto_gbb_demo/screens/pause_menu.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';

class TownMap extends StatelessWidget {
  // late final widget.controller widget.controller;
  final LitPlayer player;
  final LocalGameController controller;

  const TownMap({super.key, required this.player, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      backgroundColor: Color(0xff2c6ec7),
      background: BonfireParallaxBackground(),
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
      // widget.controller: widget.controller,
      lightingColorGame: Colors.orange[400]!.withAlpha(48),
      components: [
        BlackSmithMaster(
            position: Vector2(tileSize * 19.25, tileSize * 15.5),
            size: PlayerConsts.tallNPCSize,
            hitboxSize: PlayerConsts.characterHitbox,
            hitboxPosition: PlayerConsts.hitboxPosition,
            controller: controller),
        Anvil(
            position: Vector2(tileSize * 21.5, tileSize * 19.5),
            localGameController: controller),
        Furnace(
            position: Vector2(tileSize * 21, tileSize * 11),
            localGameController: controller),
        SwordShippingBox(
            position: Vector2(tileSize * 19, tileSize * 18.5),
            localGameController: controller),
        LaunchStation(
            position: Vector2(tileSize * 14, tileSize * 13.5),
            localGameController: controller),
        SmithingTable(
            position: Vector2(tileSize * 22.75, tileSize * 16.85),
            localGameController: controller),
        DayTimeClock(
            position: Vector2(0, 0), localGameController: controller),
        ...wheatField!,
      ],
      // ],
      cameraConfig: CameraConfig(zoom: 0.8, moveOnlyMapArea: true),
      map: WorldMapByTiled(
          WorldMapReader.fromAsset('map/new_map/ruins_map_pvp.json'),
          forceTileSize: Vector2(tileSize, tileSize)),
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

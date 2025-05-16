import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/lit_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/enum/character_faction.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs.dart';
import 'package:projeto_gbb_demo/game/objects/daytime_clock.dart';
import 'package:projeto_gbb_demo/game/objects/objects.dart';
import 'package:projeto_gbb_demo/game/objects/plants/wheat_field.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';
import 'package:projeto_gbb_demo/players/player_one/blacksmith/blacksmith.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TownMap extends StatefulWidget {
  // late final widget.controller widget.controller;
  final LocalGameController controller;

  const TownMap({super.key, required this.controller});

  @override
  State<TownMap> createState() => _TownMapState();
}

class _TownMapState extends State<TownMap> {
  late final CharacterFaction playerFaction;
  late final SimpleDirectionAnimation playerOneAnimations;
  late final String id;

  @override
  void initState() {
    playerFaction = context.read<PlayerConsts>().faccao;
    playerOneAnimations = getAnimations(playerOneClass, playerFaction);
    id = const Uuid().v1();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
  double tileSize = 192;
    LocalGameController gameController = context.read<LocalGameController>();
    LitPlayer player = BlacksmithClass(
      localGameController: gameController,
      id: id,
      playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
      onHit: () {
        gameController.hit(2);
      },
      faction: playerFaction,
      position: Vector2(tileSize * 8, tileSize * 7),
    );

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
            controller: widget.controller),
        Anvil(
            position: Vector2(tileSize * 21.5, tileSize * 19.5),
            localGameController: widget.controller),
        Furnace(
            position: Vector2(tileSize * 21, tileSize * 11),
            localGameController: widget.controller),
        SwordShippingBox(
            position: Vector2(tileSize * 19, tileSize * 18.5),
            localGameController: widget.controller),
        LaunchStation(
            position: Vector2(tileSize * 14, tileSize * 13.5),
            localGameController: widget.controller),
        SmithingTable(
            position: Vector2(tileSize * 22.75, tileSize * 16.85),
            localGameController: widget.controller),
        DayTimeClock(
            position: Vector2(0, 0), localGameController: widget.controller),
        ...wheatField!,
      ],
      // ],
      cameraConfig: CameraConfig(zoom: 0.8, moveOnlyMapArea: true),
      map: WorldMapByTiled(
          WorldMapReader.fromAsset('ruins_village_map/ruins_map_pvp.json'),
          forceTileSize: Vector2(tileSize, tileSize)),
      player: player,
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game, characterClass: playerOneClass),
        MiniGame.overlayKey: (context, game) => MiniGame(),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
        MiniGame.overlayKey,
      ],
    );
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:bonfire/player/lit_player.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/common/common.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/maps/tavern/components/exit_mat.dart';
import 'package:projeto_gbb_demo/maps/town.dart';
import 'package:projeto_gbb_demo/players/player_one/blacksmith/blacksmith.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class TavernMap extends StatefulWidget {
  final LocalGameController controller;
  final Function exitFunction;
  const TavernMap(
      {super.key,
      required this.exitFunction,
      required this.controller});

  @override
  State<TavernMap> createState() => _TavernMapState();
}

class _TavernMapState extends State<TavernMap> {
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
      position: Vector2(tileSize * 3, tileSize * 8.75),
    );
    
    void exitToTown() {
      player.position = Vector2(tileSize * 8, tileSize * 7);
      widget.controller.toggleResetCollision();
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => TownMap(
            controller: widget.controller,
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
        MiniGame.overlayKey: (context, game) => MiniGame(),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
        MiniGame.overlayKey,
      ],
    );
  }
}

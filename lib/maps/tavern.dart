import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/enum/character_class.dart';
import 'package:projeto_gbb_demo/game/enum/character_faction.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';
import 'package:projeto_gbb_demo/game/interface/player_interface.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:projeto_gbb_demo/players/player_one/blacksmith/blacksmith.dart';
import 'package:projeto_gbb_demo/screens/pause_menu.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';

double tileSize = 192;
const CharacterClass playerOneClass = CharacterClass.SwordsMan;
// const CharacterFaction playerTwoFaction = CharacterFaction.Capitalist;
// SimpleDirectionAnimation playerTwoAnimations = getArcherAnimations(playerTwoFaction);

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  // late final GameController gameController;
  late final CharacterFaction playerFaction;
  late final SimpleDirectionAnimation playerOneAnimations;
  late final String id;

  @override
  void initState() {
    playerFaction = context.read<PlayerConsts>().faccao;
    playerOneAnimations = getAnimations(playerOneClass, playerFaction);
    id = const Uuid().v1();
    // gameController = GameController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LocalGameController gameController = context.read<LocalGameController>();

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
      // gameController: gameController,
      lightingColorGame: Colors.orange[400]!.withAlpha(48),
      components: [
      ],
      // ],
      cameraConfig: CameraConfig(zoom: 0.8, moveOnlyMapArea: true),
      // cameraConfig: CameraConfig(zoom: 0.2),
      map: WorldMapByTiled(
          // WorldMapReader.fromAsset('map/new_map/ruins_map_pvp.json'),
          WorldMapReader.fromAsset('map/house_interior/yellow_house/yellow_house_map.json'),
          forceTileSize: Vector2(tileSize, tileSize)),
      player: BlacksmithClass(
        localGameController: gameController,
        id: id,
        playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
        onHit: () {
          gameController.hit(2);
        },
        faction: playerFaction,
        position: Vector2(tileSize * 15, tileSize * 13.5),
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(
            game: game,
            characterClass: playerOneClass,
            characterFaction: playerFaction),
        // PauseMenu.overlayKey: (context,game) => gameController.gameIsPaused ? const PauseMenu() : const SizedBox(),
        PauseMenu.overlayKey: (context, game) => PauseMenu(),
        MiniGame.overlayKey: (context, game) => MiniGame(),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
        PauseMenu.overlayKey,
        MiniGame.overlayKey,
      ],
      // showCollisionArea: true,
    );
  }
}

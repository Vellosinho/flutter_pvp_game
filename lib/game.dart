import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs.dart';
import 'package:projeto_gbb_demo/game/objects/daytime_clock.dart';
import 'package:projeto_gbb_demo/game/objects/objects.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'game/game_sprite_sheet.dart';
import 'game/interface/player_interface.dart';
import 'players/player_one.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'game/enum/character_class.dart';
import 'game/enum/character_faction.dart';
import 'game/game_controller.dart';
import 'players/player_consts.dart';
import 'screens/pause_menu.dart';
import 'package:projeto_gbb_demo/forge_minigame/minigame.dart';

double tileSize = 192;
const CharacterClass playerOneClass = CharacterClass.SwordsMan;
// const CharacterFaction playerTwoFaction = CharacterFaction.Capitalist;
// SimpleDirectionAnimation playerTwoAnimations = getArcherAnimations(playerTwoFaction);

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

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
  void onOtherPlayersHit = playerOneClass == CharacterClass.Archer ? context.read<LocalGameController>().addArrowHitCount() : context.read<LocalGameController>().addHitCount();

  return BonfireWidget(
    backgroundColor: Color(0xff2c6ec7),
    background: BonfireParallaxBackground(),
    playerControllers: [
      Keyboard(config: 
        KeyboardConfig(acceptedKeys: [
          LogicalKeyboardKey.arrowDown,
          LogicalKeyboardKey.arrowLeft,
          LogicalKeyboardKey.arrowUp,
          LogicalKeyboardKey.arrowRight,
          LogicalKeyboardKey.keyZ,
          LogicalKeyboardKey.keyX,
          LogicalKeyboardKey.keyC,
          LogicalKeyboardKey.escape,
        ] 
      ))
    ],
    // gameController: gameController,
        lightingColorGame: Colors.orange[400]!.withAlpha(48),
        components: [
          StaticDummy(hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, size: PlayerConsts.npcSize, position: Vector2(tileSize * 15, tileSize * 8), 
            minZoom: 0.8,
            controller: context.read<LocalGameController>(),
            onHit: () { 
          }),
          BlackSmithMaster(position: Vector2(tileSize * 19.25, tileSize * 15.5), size: PlayerConsts.tallNPCSize, hitboxSize: PlayerConsts.characterHitbox, hitboxPosition: PlayerConsts.hitboxPosition, controller: context.read<LocalGameController>()),
          Anvil(position: Vector2(tileSize * 21.5, tileSize * 19.5), localGameController: context.read<LocalGameController>()),
          Furnace(position: Vector2(tileSize * 21, tileSize * 11), localGameController: context.read<LocalGameController>()),
          SwordShippingBox(position: Vector2(tileSize * 19, tileSize * 18.5),localGameController: context.read<LocalGameController>()),
          LaunchStation(position: Vector2(tileSize * 14, tileSize * 9.5),localGameController: context.read<LocalGameController>()),
          SmithingTable(position: Vector2(tileSize * 22.75, tileSize * 16.85), localGameController: context.read<LocalGameController>()),
          DayTimeClock(position: Vector2(0,0), localGameController: context.read<LocalGameController>())
        ],
        cameraConfig: CameraConfig(zoom: 0.8),
        map: WorldMapByTiled(WorldMapReader.fromAsset('map/new_map/ruins_map_pvp.json'), forceTileSize: Vector2(tileSize, tileSize)),
        player: PlayerOne(
          localGameController: context.read<LocalGameController>(),
          id: id,
          playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
          onHit: () {
            context.read<LocalGameController>().hit(2);
          },
          faction: playerFaction,
          position: Vector2(tileSize * 15, tileSize * 9.5),
        ),
        overlayBuilderMap: {
          PlayerInterface.overlayKey: (context,game) => PlayerInterface(game: game, characterClass: playerOneClass, characterFaction: playerFaction),
          // PauseMenu.overlayKey: (context,game) => context.read<LocalGameController>().gameIsPaused ? const PauseMenu() : const SizedBox(),
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
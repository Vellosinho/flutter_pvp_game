import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game/game_objects.dart';
import 'game/game_sprite_sheet.dart';
import 'game/player_interface.dart';
import 'players/player_one.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'game/character_class.dart';
import 'game/character_faction.dart';
import 'game/game_controller.dart';
import 'game/npc_definitions.dart';
import 'players/player_consts.dart';
import 'screens/pause_menu.dart';
import 'package:projeto_gbb_demo/screens/minigame.dart';

double tileSize = 128;
const CharacterClass playerOneClass = CharacterClass.SwordsMan;
// const CharacterFaction playerTwoFaction = CharacterFaction.Capitalist;
// SimpleDirectionAnimation playerTwoAnimations = getArcherAnimations(playerTwoFaction);

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {  
  late final GameController gameController;
  late final CharacterFaction playerFaction;
  late final SimpleDirectionAnimation playerOneAnimations;
  late final String id;

  @override
  void initState() {
    playerFaction = context.read<PlayerConsts>().faccao;
    playerOneAnimations = getAnimations(playerOneClass, playerFaction);
    id = const Uuid().v1();
    gameController = GameController();
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
    backgroundColor: Colors.blue,
    gameController: gameController,
        // lightingColorGame: Colors.indigo[900]!.withAlpha(128),
        lightingColorGame: Colors.orange[400]!.withAlpha(24),
        components: [
          StaticDummy(hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, size: PlayerConsts.npcSize, position: Vector2(tileSize * 13.5, tileSize * 9.5,), 
            minZoom: 0.8,
            controller: context.read<LocalGameController>(),
            onHit: () {
              // context.read<LocalGameController>().hit(2);
              context.read<LocalGameController>().getMoney(7);
              onOtherPlayersHit;
          }),
          BlackSmithMaster(position: Vector2(tileSize * 16.5, tileSize * 8,), size: PlayerConsts.npcSize, hitboxSize: PlayerConsts.characterHitbox, hitboxPosition: PlayerConsts.hitboxPosition, controller: context.read<LocalGameController>()),
          Anvil(position: Vector2(tileSize * 21, tileSize * 17.0),localGameController: context.read<LocalGameController>()),
        ],  
        // interface: PlayerInterface(),
        cameraConfig: CameraConfig(smoothCameraEnabled: true, smoothCameraSpeed: 2, zoom: 0.8),
        joystick:
            Joystick(keyboardConfig: 
              KeyboardConfig(acceptedKeys: [
                LogicalKeyboardKey.arrowDown,
                LogicalKeyboardKey.arrowLeft,
                LogicalKeyboardKey.arrowUp,
                LogicalKeyboardKey.arrowRight,
                LogicalKeyboardKey.keyZ,
                LogicalKeyboardKey.keyX,
                LogicalKeyboardKey.escape,
              ] 
            )
          ),
        map: WorldMapByTiled('map/pvp_arena/ruinas_pvp.json', forceTileSize: Vector2(tileSize, tileSize)),
        player: PlayerOne(
          localGameController: context.read<LocalGameController>(),
          id: id,
          playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
          onHit: () {
            context.read<LocalGameController>().hit(2);
          },
          faction: playerFaction,
          position: Vector2(tileSize * 13.5, tileSize * 12.0),
          animations: playerOneAnimations,
        ),
        overlayBuilderMap: {
          PlayerInterface.overlayKey: (context,game) => PlayerInterface(characterClass: playerOneClass, characterFaction: playerFaction),
          // PauseMenu.overlayKey: (context,game) => context.read<LocalGameController>().gameIsPaused ? const PauseMenu() : const SizedBox(),
          PauseMenu.overlayKey: (context, game) => PauseMenu(),
          MiniGame.overlayKey: (context, game) => MiniGame(),
        },
        initialActiveOverlays: const [
          PlayerInterface.overlayKey,
          PauseMenu.overlayKey,
          MiniGame.overlayKey,
        ],
    );
      // showCollisionArea: true,
  }
}
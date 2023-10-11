import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game/game_objects.dart';
import 'game/game_sprite_sheet.dart';
import 'game/player_interface.dart';
import 'players/player_one.dart';
import 'players/player_two.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'entities/message.dart';
import 'game/character_class.dart';
import 'game/character_faction.dart';
import 'game/game_controller.dart';
import 'game/npc_definitions.dart';
import 'players/player_consts.dart';
import 'services/message_service.dart';

double tileSize = 128;
const CharacterClass playerOneClass = CharacterClass.SwordsMan;
// const CharacterFaction playerTwoFaction = CharacterFaction.Capitalist;
// SimpleDirectionAnimation playerTwoAnimations = getArcherAnimations(playerTwoFaction);

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {  
  late final GameController gameController;
  late final MessageService messageService;
  late final CharacterFaction playerFaction;
  late final SimpleDirectionAnimation playerOneAnimations;
  late final String id;

  @override
  void initState() {
    playerFaction = context.read<PlayerConsts>().faccao;
    playerOneAnimations = getAnimations(playerOneClass, playerFaction);
    id = const Uuid().v1();
    gameController = GameController();
    messageService = BonfireInjector.instance.get();
    messageService.init();
    // messageService.onListen(ActionMessage.enemyInvocation, _addEnemy);
    // messageService.onListen(
    //     ActionMessage.previouslyEnemyConnected, _addEnemyBeforeYourLogin);
    super.initState();
    
  }

  @override
  void dispose() {
    messageService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  void onOtherPlayersHit = playerOneClass == CharacterClass.Archer ? context.read<LocalGameController>().addArrowHitCount() : context.read<LocalGameController>().addHitCount();

  return BonfireWidget(
    gameController: gameController,
        // lightingColorGame: Colors.indigo[900]!.withAlpha(128),
        lightingColorGame: Colors.orange[400]!.withAlpha(24),
        components: [
          StaticDummy(hitboxPosition: PlayerConsts.hitboxPosition, hitboxSize: PlayerConsts.characterHitbox, size: PlayerConsts.characterSize, position: Vector2(tileSize * 13.5, tileSize * 9.5,), 
            minZoom: 0.8,
            controller: context.read<LocalGameController>(),
            onHit: () {
              // context.read<LocalGameController>().hit(2);
              context.read<LocalGameController>().getMoney(7);
              onOtherPlayersHit;
          }),
          Anvil(Vector2(tileSize * 13.5, tileSize * 12.0),),
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
                LogicalKeyboardKey.keyX
              ] 
            )
          ),
        map: WorldMapByTiled('map/pvp_arena/ruinas_pvp.json', forceTileSize: Vector2(tileSize, tileSize)),
        player: PlayerOne(
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
        },
        initialActiveOverlays: const [
          PlayerInterface.overlayKey,
        ],
        onReady: (gameRef) {
          messageService.send(
            Message(
              idPlayer: id,
              action: ActionMessage.enemyInvocation,
              direction: DirectionMessage.right,
              position: Vector2(
                gameRef.player!.position.x,
                gameRef.player!.position.y,
              ),
            ),
          );
        },
    );
      // showCollisionArea: true,
  }
  
  // void _addEnemy(Message message) {
  //   final enemy = PlayerTwo(
  //     animations: playerTwoAnimations,
  //     faction: playerTwoFaction,
  //     playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
  //     onHit: () {
  //       // context.read<LocalGameController>().hit(2);
  //     },
  //     id: message.idPlayer,
  //     position: message.position!,
  //     direction: message.direction.toDirection(),
  //   );
  //   gameController.addGameComponent(enemy);
  //   messageService.send(
  //     Message(
  //       idPlayer: id,
  //       action: ActionMessage.previouslyEnemyConnected,
  //       direction: DirectionMessage.direction(
  //         gameController.player!.lastDirection,
  //       ),
  //       position: gameController.player!.position,
  //     ),
  //   );
  // }

  // void _addEnemyBeforeYourLogin(Message message) {
  //   final hasEnemy = gameController.gameRef
  //       .componentsByType<PlayerTwo>()
  //       .any((element) => element.id == message.idPlayer);
  //   if (!hasEnemy) {
  //     final enemy = PlayerTwo(
  //       animations: playerTwoAnimations,
  //       faction: playerTwoFaction,
  //       playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
  //       onHit: () {
  //         // context.read<LocalGameController>().hit(2);
  //       },
  //       id: message.idPlayer,
  //       position: message.position!,
  //       direction: message.direction.toDirection(),
  //     );
  //     gameController.addGameComponent(enemy);
  //   }
  // }
}
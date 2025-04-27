import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs.dart';
import 'package:projeto_gbb_demo/game/objects/daytime_clock.dart';
import 'package:projeto_gbb_demo/game/objects/objects.dart';
import 'package:projeto_gbb_demo/game/objects/plants/wheat_field.dart';
import 'package:projeto_gbb_demo/maps/tavern.dart';
import 'package:projeto_gbb_demo/parallax/parallax_clouds.dart';
import 'package:projeto_gbb_demo/players/player_one/blacksmith/blacksmith.dart';
import 'game/game_sprite_sheet.dart';
import 'game/interface/player_interface.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'game/enum/character_class.dart';
import 'game/enum/character_faction.dart';
import 'game/controller/game_controller.dart';
import 'players/player_consts.dart';
import 'screens/pause_menu.dart';
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

    return TavernMap(
        player: BlacksmithClass(
          localGameController: gameController,
          id: id,
          playerLife:
              context.watch<LocalGameController>().playerLife.toDouble(),
          onHit: () {
            gameController.hit(2);
          },
          faction: playerFaction,
          position: Vector2(tileSize * 15, tileSize * 13.5),
        ),
        controller: gameController);
  }
}

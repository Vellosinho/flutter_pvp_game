import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/maps/tavern/tavern.dart';
import 'game/game_sprite_sheet.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'game/enum/character_class.dart';
import 'game/enum/character_faction.dart';
import 'game/controller/game_controller.dart';
import 'players/player_consts.dart';

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
    context.read<LocalGameController>().startDaynightCycle();
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
        exitFunction: () {}, controller: gameController);
  }
}

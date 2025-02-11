import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/interface/minimap.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';
import '../enum/character_faction.dart';
import '../controller/game_controller.dart';
import '../game_sprite_sheet.dart';
import 'package:provider/provider.dart';
import '../enum/character_class.dart';

class PlayerInterface extends StatefulWidget {
  final BonfireGame game;
  final CharacterClass characterClass;
  CharacterFaction? characterFaction = CharacterFaction.Monarchist;
  static const overlayKey = 'playerInterface';

  PlayerInterface({required this.game, required this.characterClass, this.characterFaction, Key? key}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  @override
  Widget build(BuildContext context) {
    // return PlayerLife(game: widget.game, characterClass: widget.characterClass, characterFaction: widget.characterFaction,);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PlayerLife(game: widget.game, characterClass: widget.characterClass, characterFaction: widget.characterFaction),
          GameMiniMap(game: widget.game),
        ],
      ),
    );
  }
}

class PlayerLife extends StatelessWidget {
  final BonfireGame game;
  final CharacterClass characterClass;
  final CharacterFaction? characterFaction;
  
  const PlayerLife({required this.game, required this.characterClass, this.characterFaction, Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900]!.withAlpha(0),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
                          // LifebarInterface(characterClass: characterClass, characterFaction: characterFaction),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Inventory(),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}

class Inventory extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return 
      Consumer<LocalGameController>(
        builder: (context, controller, _) => Stack(
          children: [
            SizedBox(height: 88, width: 304, child: DecoratedBox(decoration: BoxDecoration(color: Colors.black.withAlpha(160)),)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: [
                InventorySlot(item: controller.inventory[0],),
                InventorySlot(item: controller.inventory[1],),
                InventorySlot(item: controller.inventory[2],),
                InventorySlot(item: controller.inventory[3],),
                        ],),
            ),
          InterfaceSpriteSheet.inventoryBar
        ]),
      );
  }
}

class InventorySlot extends StatelessWidget {
  final Item? item;
  const InventorySlot({this.item, super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: SizedBox(height: 64, width: 64,
        child: (item?.assetPath == 'empty') ?
          SizedBox() 
          : item?.assetPath),
    );
  }
}


class LifebarInterface extends StatelessWidget {
  final CharacterClass characterClass;
  final CharacterFaction? characterFaction;
  const LifebarInterface({required this.characterClass, required this.characterFaction, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> token = getToken(characterClass, characterFaction!);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 144, top: 96),
          child: Row(
            children: [
              InterfaceSpriteSheet.coin,
              const SizedBox(width: 8),
              Text('${context.watch<LocalGameController>().playerWallet}', style: TextStyle(fontFamily: 'PressStart2P', color: Colors.amber[400], fontSize: 24),),
              const SizedBox(width: 8),
              InterfaceSpriteSheet.people ,
              const SizedBox(width: 8),
              Text('${context.watch<LocalGameController>().playerFollowers}', style: const TextStyle(fontFamily: 'PressStart2P', color: Colors.white, fontSize: 24),),
            ],
          ),
        ),
        token[1],
        token[0],
        LifeBar(life: (20 - context.watch<LocalGameController>().playerLife)),
      ],
    );
  }
}
class LifeBar extends StatefulWidget {
  final num life;
  const LifeBar({required this.life, Key? key}) : super(key: key);

  @override
  State<LifeBar> createState() => _LifeBarState();
}

class _LifeBarState extends State<LifeBar> {
  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   children: [
    //     InterfaceSpriteSheet.lifebarList[19],
    //     InterfaceSpriteSheet.lifebarList[widget.life.toInt()],
    //   ],
    // );
    return InterfaceSpriteSheet.lifeBar;
  }
}

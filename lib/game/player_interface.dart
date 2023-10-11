import 'package:flutter/material.dart';
import 'character_faction.dart';
import 'game_controller.dart';
import 'game_sprite_sheet.dart';
import 'package:provider/provider.dart';
import 'character_class.dart';

class PlayerInterface extends StatefulWidget {
  final CharacterClass characterClass;
  CharacterFaction? characterFaction = CharacterFaction.Monarchist;
  static const overlayKey = 'playerInterface';

  PlayerInterface({required this.characterClass, this.characterFaction, Key? key}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  @override
  Widget build(BuildContext context) {
    return PlayerLife(characterClass: widget.characterClass, characterFaction: widget.characterFaction,);
  }
}

class PlayerLife extends StatelessWidget {
  final CharacterClass characterClass;
  final CharacterFaction? characterFaction;
  
  const PlayerLife({required this.characterClass, this.characterFaction, Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    List<Widget> token = getToken(characterClass, characterFaction!);
    return Scaffold(
      backgroundColor: Colors.red[900]!.withAlpha(0),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:  8.0),
                    child: Stack(
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
                        LifeBar(life: (20 - context.watch<LocalGameController>().playerLife)),
                        token[1],
                        token[0],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}

class LifeBar extends StatefulWidget {
  final num life;
  const LifeBar({required this.life, Key? key}) : super(key: key);

  @override
  State<LifeBar> createState() => _LifeBarState();
}

class _LifeBarState extends State<LifeBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InterfaceSpriteSheet.lifebarList[19],
        InterfaceSpriteSheet.lifebarList[widget.life.toInt()],
      ],
    );
  }
}

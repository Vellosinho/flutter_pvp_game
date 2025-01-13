import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_gbb_demo/game/character_faction.dart';
import 'package:provider/provider.dart';

import '../game/game_sprite_sheet.dart';
import '../players/player_consts.dart';
import 'faction_details.dart';

class FactionScreen extends StatelessWidget {
  const FactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Stack(
        children: [
          Center(child: InterfaceSpriteSheet.titleScreen),
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: [
                    InterfaceSpriteSheet.menuScreen,
                  ],
                ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameButton(
                    enabled: true,
                    image: InterfaceSpriteSheet.workersBanner,
                    selectedImage: InterfaceSpriteSheet.workersBannerSelected,
                    onTap: () {
                      context.read<PlayerConsts>().setFaction(CharacterFaction.Communist);
                      },
                    ),
                  GameButton(
                    enabled: false,
                    image: InterfaceSpriteSheet.ownersBanner,
                    selectedImage: InterfaceSpriteSheet.ownersBannerSelected, 
                    onTap: () {
                    context.read<PlayerConsts>().setFaction(CharacterFaction.Capitalist);
                  }),
                  GameButton(
                    enabled: true,
                    image: InterfaceSpriteSheet.loyalistsBanner,
                    selectedImage: InterfaceSpriteSheet.loyalistsBannerSelected,
                    onTap: () {
                    context.read<PlayerConsts>().setFaction(CharacterFaction.Monarchist);
                  }),
                  
                  ],),
                Positioned(
                  bottom: 32,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const[
                        Text("Workers", style: TextStyle(fontFamily: "PressStart2P", fontSize: 28,)),
                        SizedBox(width: 88),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text("Owners", style: TextStyle(fontFamily: "PressStart2P", fontSize: 28)),
                        ),
                        SizedBox(width: 104),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("Royals", style: TextStyle(fontFamily: "PressStart2P", fontSize: 28)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: const [Text("Select your Faction", style: TextStyle(fontFamily: "PressStart2P", fontSize: 36),)],),
          )
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class GameButton extends StatefulWidget {
  bool enabled;
  final Widget image;
  final Widget selectedImage;
  final Function onTap;
  GameButton({super.key, required this.image, required this.selectedImage, required this.onTap, required this.enabled});

  @override
  State<GameButton> createState() => _GameButtonState();
}

class _GameButtonState extends State<GameButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: !isSelected ? 24 : 16,  right: !isSelected ? 24 : 16, bottom: !isSelected ? 16 : 0),
      child: MouseRegion(
        child: GestureDetector(
          onTap: () {
            if (widget.enabled) {
              widget.onTap();
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Game()));
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FactionDetails()));
            } else {}
          },
          child: !isSelected ? widget.image : widget.selectedImage,
        ),
        onEnter: (details) {
          if(widget.enabled) {
            setState(() {
              isSelected = true;
            });
          }
        },
        onExit: (details) {
          if(widget.enabled) {
            setState(() {
              isSelected = false;
            });
          }
        },
      ),
    );
  }
}
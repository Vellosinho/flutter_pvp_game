import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class GameMiniMap extends StatelessWidget {
  final BonfireGame game;
  const GameMiniMap({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Stack(
        children: [
          MiniMap(
            margin: EdgeInsets.only(right: 30, top: 30),
            zoom: 0.75,
            game:game,
            tileColor: Color(0xff72751b),
            backgroundColor: Color(0xff2196f3),
            tileCollisionColor: Color(0xff858275),
            playerColor: Color(0xffd90000),
            enemyColor: Colors.deepOrangeAccent,
            size: Vector2(260, 260),
            borderRadius: BorderRadius.circular(200),
          ),
           InterfaceSpriteSheet.miniMapDecoration,
        ]
      ),
    );
  }
}
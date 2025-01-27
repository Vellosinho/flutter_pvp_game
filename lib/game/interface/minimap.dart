import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';
import 'package:provider/provider.dart';

class GameMiniMap extends StatelessWidget {
  final BonfireGame game;
  const GameMiniMap({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalGameController>(
      builder: (BuildContext context, LocalGameController controller, _) => Positioned(
        bottom: 16,
        right: 16,
        child: Stack(
          children: [
            MiniMap(
              margin: EdgeInsets.only(right: 30, top: 50),
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
            Positioned(right: 30, top: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: AnimatedContainer(
                  duration: Duration(seconds: 10),
                  height: 260,
                  width: 260,
                  color: controller.mapTintColor,
                  curve: Curves.easeOut,
                  
                  ),
              ),
              ),
            InterfaceSpriteSheet.miniMapDecoration,
            Positioned(top: 18, right: 294, child: Transform.rotate(angle: ((2 * pi) / 24 * controller.hour) - pi, child: SizedBox(height: 60, width: 3, child: Column(
              children: [
                 SizedBox(height: 40, width: 3,child: DecoratedBox( decoration: BoxDecoration(color: Colors.red),)),
               ],
             )))),
            Positioned(bottom: 56, right: 400, child: Row(
            children: [
              InterfaceSpriteSheet.coin,
              const SizedBox(width: 8),
              Text('${context.watch<LocalGameController>().playerWallet}', style: TextStyle(fontFamily: 'PressStart2P', color: Colors.amber[400], fontSize: 24),),
              const SizedBox(width: 8),
              InterfaceSpriteSheet.people ,
              const SizedBox(width: 8),
              Text('${context.watch<LocalGameController>().playerFollowers}', style: const TextStyle(fontFamily: 'PressStart2P', color: Colors.white, fontSize: 24),),
            ],
          ),)
          ]
        ),
      ),
    );
  }
}
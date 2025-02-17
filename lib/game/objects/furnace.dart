import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/players/consts.dart';

class Furnace extends GameDecoration with Attackable {
  LocalGameController localGameController;
  int stashedIron = 0;
  Furnace({
    required super.position,required this.localGameController})
      : super.withAnimation(animation: GameObjectsSprites.activeFurnace, size: Vector2(384, 1152)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(324, 192), position: Vector2(24, 932),));
      updateLighting(radiusWidth: 0.65);
      initFurnace();
      Future.delayed(Duration(microseconds: 400),() {
        fireOscilation();
      });
      return super.onLoad();
    }

    void fireOscilation() {
      Random rand = Random();
      int random = rand.nextInt(10) + 50;
      updateLighting(radiusWidth: (random / 100));
      Future.delayed(Duration(seconds: 1), () {
        fireOscilation();
      });
    }

    void updateLighting({required double radiusWidth}) {
      setupLighting(
        LightingConfig(
          radius: width * radiusWidth,
          align: Vector2(0, 460),
          color: ElementColors.fireColor.withAlpha(80),
          blurBorder: 120, // this is a default value
        ),
      );
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    }
     //  Furnace functions:

    void initFurnace() {
      Future.delayed(Duration(seconds: 15), () {
        produceIron();
      });
    }

    void produceIron() {
      if(stashedIron < 5) {
        stashedIron++;
      }
      Future.delayed(Duration(seconds: 15), () {
        produceIron();
      });
    }
  
    
    @override
    void onReceiveDamage(attacker, double damage, identify, damageType) {
      bool gotIron = localGameController.getIron(stashedIron);
      if (gotIron) {
        stashedIron--;
      }
      super.onReceiveDamage(attacker, 0.0, identify, damageType);
    }
} 
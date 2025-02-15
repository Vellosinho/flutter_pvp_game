import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/common/common.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/static_dummy.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class Wheat extends GameDecoration with Attackable {
  bool isOnFire = false;
  int spreadCount = 10;
  Random rand = Random();

  Wheat({
    required super.position})
      // : super.withAnimation(animation: GameObjectsSprites., size: Vector2(384, 1152)) 
      : super.withAnimation(animation: GameObjectsSprites.wheat, size: Vector2(192, 192)) 
;    @override
    Future<void> onLoad() {
      setupLighting(
      LightingConfig(
        radius: 0,
        color: Color(0xffea5c0a).withAlpha(80),
        // color: Color(0xff9dc1e8).withAlpha(80),
        blurBorder: 160,
        align: Vector2(0, 128),
        ),
      );
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, damage, identify, damageType) {
      if(damageType == DamageType.FIRE && spreadCount > 0) {
        int chance = rand.nextInt(10);
        if (chance > 5) {
          setFire();
        }
      }
      super.onReceiveDamage(attacker, damage, identify, damageType);
    }

    Future<void> setFire() async {
      int animationNum = rand.nextInt(2);
      if (animationNum < 1) {
        setAnimation(await GameObjectsSprites.wheatFire);
      } else {
        setAnimation(await GameObjectsSprites.wheatFire2);
      }
      setupLighting(
      LightingConfig(
        radius: width * 1.2,
        color: Color(0xffea5c0a).withAlpha(80),
        // color: Color(0xff9dc1e8).withAlpha(80),
        blurBorder: 160,
        align: Vector2(0, 128),
        ),
      );

      Future.delayed(Duration(seconds: 5), () {
        fireSpread();
      });
    }

    void fireSpread() {
      if(spreadCount > 0) {
        int chance = rand.nextInt(10);

        if (chance > 8) {
          simpleAttackMeleeByAngle(
            centerOffset: Vector2(-96, -96),
            // sizePush: 0.2,
            withPush: false,
            damage: 5, 
            angle: 0, 
            attackFrom: AttackOriginEnum.WORLD,
            size: Vector2(384, 384), 
            damageType: DamageType.FIRE,
          );
        }
        spreadCount--;


        Future.delayed(Duration(seconds: 5), () {
          fireSpread();
        });
      } else {
        killWheat();
      }
    }

    void killWheat() async {
      setupLighting(
        LightingConfig(
          radius: 0,
          color: Color(0xffea5c0a).withAlpha(80),
          // color: Color(0xff9dc1e8).withAlpha(80),
          blurBorder: 160,
          align: Vector2(0, 128),
          ),
      );
      setAnimation(await GameObjectsSprites.deadWheat);
    }
        
}

List<GameComponent>? wheatField = [
    Wheat(position: Vector2(tileSize * 19, tileSize * 9.5)),
    Wheat(position: Vector2(tileSize * 19, tileSize * 10)),
    Wheat(position: Vector2(tileSize * 19, tileSize * 10.5)),
    Wheat(position: Vector2(tileSize * 19, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 20, tileSize * 10.5)),
    Wheat(position: Vector2(tileSize * 20, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 20, tileSize * 11.5)),
    Wheat(position: Vector2(tileSize * 20, tileSize * 12)),
    Wheat(position: Vector2(tileSize * 21, tileSize * 10.5)),
    Wheat(position: Vector2(tileSize * 21, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 21, tileSize * 11.5)),
    Wheat(position: Vector2(tileSize * 21, tileSize * 12)),
    StaticDummy(position: Vector2(tileSize * 21, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 21, tileSize * 12.5)),
    Wheat(position: Vector2(tileSize * 22, tileSize * 10.5)),
    Wheat(position: Vector2(tileSize * 22, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 22, tileSize * 11.5)),
    Wheat(position: Vector2(tileSize * 22, tileSize * 12)),
    Wheat(position: Vector2(tileSize * 22, tileSize * 12.5)),
    Wheat(position: Vector2(tileSize * 23, tileSize * 10.5)),
    Wheat(position: Vector2(tileSize * 23, tileSize * 11)),
    Wheat(position: Vector2(tileSize * 23, tileSize * 11.5)),
    Wheat(position: Vector2(tileSize * 23, tileSize * 12)),
  ];
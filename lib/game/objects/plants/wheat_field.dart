import 'package:bonfire/bonfire.dart';
import 'package:bonfire/mixins/flamable.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/common/common.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/npcs/static_dummy.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class Wheat extends GameDecoration with Attackable, Flamable{

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
        if (chance > 4) {
          setFire();
        }
      } 
      super.onReceiveDamage(attacker, damage, identify, damageType);
    }

    @override
    Future<void> setFire() async {
      int animationNum = rand.nextInt(2);
      if (animationNum < 1) {
        setAnimation(await GameObjectsSprites.wheatFire);
      } else {
        setAnimation(await GameObjectsSprites.wheatFire2);
      }
      super.setFire();
    }

    @override
    Future<void> onBurn() async {
      setAnimation(await GameObjectsSprites.deadWheat);
      super.onBurn();
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
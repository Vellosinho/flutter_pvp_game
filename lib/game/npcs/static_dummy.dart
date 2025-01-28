import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';

class StaticDummy extends SimpleEnemy with BlockMovementCollision{
  Function onHit;
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  double minZoom;
  int hitCount = 0;

  StaticDummy({
    required Vector2 position,  
    required Vector2 size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.onHit,
    required this.controller,
    required this.minZoom,
  }) : super(
    position: position,
    size: size,
    speed: 0,
    animation: SimpleDirectionAnimation(
      idleDown: NPCSprites.dummyStand,
      idleRight: NPCSprites.dummyStand,
      runRight: NPCSprites.dummyStand,
      
    ),
    ) {}

    @override
    Future<void> onLoad() {
      add(RectangleHitbox(
        size: hitboxSize,
        position: hitboxPosition,));

      animation?.playOnce(NPCSprites.dummyCreate);
      return super.onLoad();
    }

    @override
    void onReceiveDamage(attacker, double damage, identify) { 
    onHit();
    // gameRef.camera.shake(intensity: 6);
    // handleZoom(minZoom);
    animation?.playOnce(
      NPCSprites.dummyHit
    );
    // if(hitCount < 4) {
    //   TalkDialog.show(context, dummyTutorial(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
    //   hitCount++;
    // }
    super.onReceiveDamage(attacker, damage, identify);
  }

  @override
  void onDie() {
    animation?.playOnce(NPCSprites.dummyBreak);
    Future.delayed(Duration(seconds: 1), () {
      gameRef.add(StaticDummy(position: Vector2(tileSize * 15, tileSize * 8), size: size, hitboxSize: hitboxSize, hitboxPosition: hitboxPosition, onHit: onHit, controller: controller, minZoom: minZoom));
      removeFromParent();
    });
    super.onDie();
  }

  void handleZoom(double minZoom) {
    Future.delayed(const Duration(milliseconds: 250), () {
      gameRef.camera.animateZoom(
        zoom: Vector2(minZoom + (controller.hitcount * 0.05), minZoom + (controller.hitcount * 0.05)),
        effectController: EffectController(
          duration: 0.250,
          curve: Curves.easeInSine,

        ),
      );
    });
    Future.delayed(const Duration(seconds: 4), () {
      gameRef.camera.animateZoom(
        zoom: Vector2(minZoom + (controller.hitcount * 0.075), minZoom + (controller.hitcount * 0.075)),
        effectController: EffectController(
          duration: 0.250,
          curve: Curves.easeInSine,

        ),
      );
    });
  }
}
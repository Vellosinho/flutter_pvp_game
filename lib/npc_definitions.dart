import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game_controller.dart';

import 'game_sprite_sheet.dart';

class StaticDummy extends SimpleEnemy with ObjectCollision {
  Function onHit;
  LocalGameController controller;
  double minZoom;

  StaticDummy({
    required Vector2 position,  
    required Vector2 size,
    required Vector2 hitboxSize,
    required Vector2 hitboxPosition,
    required this.onHit,
    required this.controller,
    required this.minZoom,
  }) : super(
    position: position,
    size: size,
    speed: 0,
    animation: SimpleDirectionAnimation(
      idleDown: GameSpriteSheet.dummyStand,
      idleRight: GameSpriteSheet.dummyStand,
      runRight: GameSpriteSheet.dummyStand,
      
    ),
    ) {
      setupCollision(
        CollisionConfig(collisions: [
          CollisionArea.rectangle(
            size: hitboxSize,
            align: hitboxPosition,
          )
        ])
      );
    }

    @override
    void receiveDamage(AttackFromEnum attacker, double damage, identify) { 
    onHit();
    gameRef.camera.shake(intensity: 6);
    handleZoom(minZoom);
    animation?.playOnce(
      GameSpriteSheet.dummyHit
    );
    super.receiveDamage(attacker, damage, identify);
  }

  void handleZoom(double minZoom) {
    Future.delayed(const Duration(milliseconds: 250), () {
      gameRef.camera.animateZoom(zoom: minZoom + (controller.hitcount * 0.05), duration : const Duration(milliseconds: 250), curve: Curves.easeInSine);
    });
    Future.delayed(const Duration(seconds: 4), () {
      gameRef.camera.animateZoom(zoom: minZoom + (controller.hitcount * 0.05), duration: const Duration(milliseconds: 250));
    });
  }
}
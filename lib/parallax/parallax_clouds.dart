
import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class BonfireParallaxBackground extends GameBackground {
  @override
  void onMount() {
    _addParallax();
    super.onMount();
  }

  void _addParallax() async {
    final p = await loadCameraParallaxComponent(
      size: Vector2(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      [
        ParallaxImageData(BackgroundImages.clouds),
      ],
      baseVelocity: Vector2(0.75, 0.75),
      scale: Vector2(6, 6),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );
    add(p);
  }
}
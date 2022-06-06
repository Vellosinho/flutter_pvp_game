import 'package:bonfire/bonfire.dart';

class GameSpriteSheet {
  static Future<SpriteAnimation> get archerIdleLeft => SpriteAnimation.load(
    'archer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerIdleRight => SpriteAnimation.load(
    'archer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerIdleFront => SpriteAnimation.load(
    'archer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerIdleBack => SpriteAnimation.load(
    'archer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerWalkLeft => SpriteAnimation.load(
    'archer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerWalkRight => SpriteAnimation.load(
    'archer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerWalkFront => SpriteAnimation.load(
    'archer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get archerWalkBack => SpriteAnimation.load(
    'archer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
}

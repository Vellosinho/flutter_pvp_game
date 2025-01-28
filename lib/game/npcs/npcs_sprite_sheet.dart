import 'package:bonfire/bonfire.dart';

class NPCSprites {
  static Future<SpriteAnimation> get dummyStand => SpriteAnimation.load(
    'dummy_stand.png',
    SpriteAnimationData.sequenced(amount: 7, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get smithMasterStand => SpriteAnimation.load(
    'tutorialNPCs/smith_master_idle.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get dummyHit => SpriteAnimation.load(
    'dummy_hit.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get dummyBreak => SpriteAnimation.load(
    'dummy_break.png',
    SpriteAnimationData.sequenced(amount: 5, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get dummyCreate => SpriteAnimation.load(
    'dummy_create.png',
    SpriteAnimationData.sequenced(amount: 5, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get arrowHorizontalRight => SpriteAnimation.load(
    'arrow_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.3  , textureSize: Vector2(22,14))
  );
}
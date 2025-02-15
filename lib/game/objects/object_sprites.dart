import 'package:bonfire/bonfire.dart';

class GameObjectsSprites {
  //anvil sprites:
  static Future<Sprite> anvil = Sprite.load('objects/anvil.png');
  static Future<Sprite> anvilFirstHit = Sprite.load('objects/anvil_minigame/anvil_minigame_1.png');
  static Future<Sprite> anvilSecondHit = Sprite.load('objects/anvil_minigame/anvil_minigame_2.png');
  static Future<Sprite> anvilThirdHit = Sprite.load('objects/anvil_minigame/anvil_minigame_3.png');
  static Future<Sprite> anvilFourthHit = Sprite.load('objects/anvil_minigame/anvil_minigame_4.png');
  static Future<Sprite> anvilFifthHit = Sprite.load('objects/anvil_minigame/anvil_minigame_5.png');
  
  //sword shipping box sprites:
  static Future<Sprite> swordShippingBoxEmpty = Sprite.load('objects/sword_box/sword_box_0.png');
  static Future<Sprite> swordShippingBoxOne = Sprite.load('objects/sword_box/sword_box_1.png');
  static Future<Sprite> swordShippingBoxTwo = Sprite.load('objects/sword_box/sword_box_2.png');
  static Future<Sprite> swordShippingBoxThree = Sprite.load('objects/sword_box/sword_box_3.png');
  static Future<Sprite> swordShippingBoxFour = Sprite.load('objects/sword_box/sword_box_4.png');

  static Future<Sprite> anvilMinigame = Sprite.load('objects/anvil_minigame.png');

  // Smithing Table
  static Future<Sprite> smithingTableEmpty = Sprite.load('objects/smithing_table/empty_smithing_table.png');
  static Future<Sprite> smithingTableHammer = Sprite.load('objects/smithing_table/hammer_smithing_table.png');
  
  //furnace
  static Future<Sprite> furnace = Sprite.load('objects/furnace.png');
  static Future<SpriteAnimation> get activeFurnace => SpriteAnimation.load(
    'objects/active_furnace.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.2, textureSize: Vector2(64,192))
  );

  // Wheat
  static Future<SpriteAnimation> wheat = SpriteAnimation.load('objects/wheat_fields/wheat_animation.png', SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32, 32)));
  static Future<SpriteAnimation> wheatFire = SpriteAnimation.load('objects/wheat_fields/wheat_fire_animation.png', SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32, 32)));
  static Future<SpriteAnimation> wheatFire2 = SpriteAnimation.load('objects/wheat_fields/wheat_fire_animation_var2.png', SpriteAnimationData.sequenced(amount: 4, stepTime: 0.4, textureSize: Vector2(32, 32)));
  static Future<SpriteAnimation> deadWheat = SpriteAnimation.load('objects/wheat_fields/dead_wheat.png', SpriteAnimationData.sequenced(amount: 1, stepTime: 0.4, textureSize: Vector2(32, 32)));

  //
  static Future<Sprite> launchStation = Sprite.load('objects/launch_station/launch_station_idle.png');
  static Future<SpriteAnimation> launchStationActivation = SpriteAnimation.load('objects/launch_station/launch_station_activating.png', SpriteAnimationData.sequenced(amount: 10, stepTime: 0.2, textureSize: Vector2(92, 70)));
  static Future<Sprite> launchStationActivated = Sprite.load('objects/launch_station/launch_station_activated.png');
}
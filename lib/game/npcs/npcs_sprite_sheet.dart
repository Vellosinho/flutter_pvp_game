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
  static Future<SpriteAnimation> get smithMasterStandLeft => SpriteAnimation.load(
    'tutorialNPCs/smith_master_idle_left.png',
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
  static Future<SpriteAnimation> get empty => SpriteAnimation.load(
    'empty.png',
    SpriteAnimationData.sequenced(amount: 5, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get arrowHorizontalRight => SpriteAnimation.load(
    'arrow_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.3  , textureSize: Vector2(22,14))
  );
}

class NeutralFarmerNPCSprites {
  static Future<SpriteAnimation> get neutralFarmerIdleFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerIdleRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerIdleLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerIdleBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerWalkFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerWalkRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerWalkLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmerWalkBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get neutralFarmergather => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_idle_gathering.png',
    SpriteAnimationData.sequenced(amount:5, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get farmerReading => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/tutorial_farmer_reading.png',
    SpriteAnimationData.sequenced(amount: 12, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get farmerPray => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_farmer/neutral_farmer_pray.png',
    SpriteAnimationData.sequenced(amount: 1, stepTime: 0.2, textureSize: Vector2(32,34))
  );

  SimpleDirectionAnimation neutralFarmerAnimations = SimpleDirectionAnimation(
    idleUp: neutralFarmerIdleBack,
    idleRight: neutralFarmerIdleRight,
    idleLeft: neutralFarmerIdleLeft,
    idleDown: neutralFarmerIdleFront,
    runUp: neutralFarmerWalkBack,
    runRight: neutralFarmerWalkRight,
    runLeft: neutralFarmerWalkLeft,
    runDown: neutralFarmerWalkFront,
    runUpRight: neutralFarmerWalkBack,
    runUpLeft: neutralFarmerWalkBack,
    runDownRight: neutralFarmerWalkFront,
    runDownLeft: neutralFarmerWalkFront,
  );

  SimpleDirectionAnimation farmerGathering = SimpleDirectionAnimation(
    idleUp: neutralFarmergather,
    idleRight: neutralFarmergather,
    idleLeft: neutralFarmergather,
    idleDown: neutralFarmergather,
    runRight: neutralFarmergather,
  );
  SimpleDirectionAnimation neutralFarmerReading = SimpleDirectionAnimation(
    idleUp: farmerReading,
    idleRight: farmerReading,
    idleLeft: farmerReading,
    idleDown: farmerReading,
    runRight: farmerReading,
  );
  SimpleDirectionAnimation neutralFarmerPraying = SimpleDirectionAnimation(
    idleUp: farmerPray,
    idleRight: farmerPray,
    idleLeft: farmerPray,
    idleDown: farmerPray,
    runRight: farmerPray,
  );
}

class CommunistFarmerNPCSprites {
  static Future<SpriteAnimation> get communistFarmerIdleFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerIdleRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerIdleLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerIdleBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerWalkFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerWalkRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerWalkLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get communistFarmerWalkBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/communist_farmer/tutorial_farmer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );

  SimpleDirectionAnimation communistFarmerAnimations = SimpleDirectionAnimation(
    idleUp: communistFarmerIdleBack,
    idleRight: communistFarmerIdleRight,
    idleLeft: communistFarmerIdleLeft,
    idleDown: communistFarmerIdleFront,
    runUp: communistFarmerWalkBack,
    runRight: communistFarmerWalkRight,
    runLeft: communistFarmerWalkLeft,
    runDown: communistFarmerWalkFront,
    runUpRight: communistFarmerWalkBack,
    runUpLeft: communistFarmerWalkBack,
    runDownRight: communistFarmerWalkFront,
    runDownLeft: communistFarmerWalkFront,
  );
}

class NeutralSheppardNPCSprites {
  static Future<SpriteAnimation> get idleFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get idleBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get walkFront => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get walkRight => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get walkLeft => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );
  static Future<SpriteAnimation> get walkBack => SpriteAnimation.load(
    'tutorialNPCs/tutorial_farmer/neutral_shepard/tutorial_shepard_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,34))
  );

  
  SimpleDirectionAnimation defaultAnimations = SimpleDirectionAnimation(
    idleUp: idleBack,
    idleRight: idleRight,
    idleLeft: idleLeft,
    idleDown: idleFront,
    runUp: walkBack,
    runRight: walkRight,
    runLeft: walkLeft,
    runDown: walkFront,
    runUpRight: walkBack,
    runUpLeft: walkBack,
    runDownRight: walkFront,
    runDownLeft: walkFront,
  );
}
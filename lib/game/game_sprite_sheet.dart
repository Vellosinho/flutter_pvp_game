import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';
import 'character_class.dart';
import 'character_faction.dart';


class GameSpriteSheet {
  // Archer Sprites
  static Future<SpriteAnimation> get capitalistArcherIdleLeft => SpriteAnimation.load(
    'capitalist/capitalist_archer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherIdleRight => SpriteAnimation.load(
    'capitalist/capitalist_archer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherIdleFront => SpriteAnimation.load(
    'capitalist/capitalist_archer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherIdleBack => SpriteAnimation.load(
    'capitalist/capitalist_archer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherWalkLeft => SpriteAnimation.load(
    'capitalist/capitalist_archer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherDashLeft => SpriteAnimation.load(
    'capitalist/capitalist_archer_dash_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherWalkRight => SpriteAnimation.load(
    'capitalist/capitalist_archer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherWalkFront => SpriteAnimation.load(
    'capitalist/capitalist_archer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get capitalistArcherWalkBack => SpriteAnimation.load(
    'capitalist/capitalist_archer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  // Communist Sprites
  static Future<SpriteAnimation> get forgeSuccessful => SpriteAnimation.load(
    'communist/communist_archer_sword_complete.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get communistArcherIdleLeft => SpriteAnimation.load(
    'communist/communist_archer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherIdleRight => SpriteAnimation.load(
    'communist/communist_archer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherIdleFront => SpriteAnimation.load(
    'communist/communist_archer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherIdleBack => SpriteAnimation.load(
    'communist/communist_archer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherWalkLeft => SpriteAnimation.load(
    'communist/communist_archer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherDashLeft => SpriteAnimation.load(
    'communist/communist_archer_dash_left.png',
    SpriteAnimationData.sequenced(amount:4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherWalkRight => SpriteAnimation.load(
    'communist/communist_archer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherDashRight => SpriteAnimation.load(
    'communist/communist_archer_dash_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherWalkFront => SpriteAnimation.load(
    'communist/communist_archer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherDashFront => SpriteAnimation.load(
    'communist/communist_archer_dash_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherWalkBack => SpriteAnimation.load(
    'communist/communist_archer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArcherDashBack => SpriteAnimation.load(
    'communist/communist_archer_dash_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get loyalistArcherIdleLeft => SpriteAnimation.load(
    'loyalist/loyalist_archer_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherIdleRight => SpriteAnimation.load(
    'loyalist/loyalist_archer_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherIdleFront => SpriteAnimation.load(
    'loyalist/loyalist_archer_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherIdleBack => SpriteAnimation.load(
    'loyalist/loyalist_archer_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherWalkLeft => SpriteAnimation.load(
    'loyalist/loyalist_archer_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherWalkRight => SpriteAnimation.load(
    'loyalist/loyalist_archer_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherWalkFront => SpriteAnimation.load(
    'loyalist/loyalist_archer_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistArcherWalkBack => SpriteAnimation.load(
    'loyalist/loyalist_archer_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get dummyStand => SpriteAnimation.load(
    'dummy_stand.png',
    SpriteAnimationData.sequenced(amount: 7, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get smithMasterStand => SpriteAnimation.load(
    'tutorialNPCs/smith_master_idle.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get dummyHit => SpriteAnimation.load(
    'dummy_hit.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get attackHorizontalRight => SpriteAnimation.load(
    'horizontal_attack_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get arrowHorizontalRight => SpriteAnimation.load(
    'arrow_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.3  , textureSize: Vector2(22,14))
  );

  //Knight Sprites
  static Future<SpriteAnimation> get loyalistKnightIdleLeft => SpriteAnimation.load(
    'loyalist/loyalist_knight_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightIdleRight => SpriteAnimation.load(
    'loyalist/loyalist_knight_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightIdleFront => SpriteAnimation.load(
    'loyalist/loyalist_knight_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightIdleBack => SpriteAnimation.load(
    'loyalist/loyalist_knight_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightWalkLeft => SpriteAnimation.load(
    'loyalist/loyalist_knight_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightWalkRight => SpriteAnimation.load(
    'loyalist/loyalist_knight_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightWalkFront => SpriteAnimation.load(
    'loyalist/loyalist_knight_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get loyalistKnightWalkBack => SpriteAnimation.load(
    'loyalist/loyalist_knight_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.05, textureSize: Vector2(32,32))
  );
  
}

class GameObjectsSprites {
  static Future<Sprite> anvil = Sprite.load('objects/anvil.png');
}

  SimpleDirectionAnimation communistArcher = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.communistArcherIdleRight,
    runRight: GameSpriteSheet.communistArcherWalkRight,
    idleLeft: GameSpriteSheet.communistArcherIdleLeft,
    runLeft: GameSpriteSheet.communistArcherWalkLeft,
    idleDown: GameSpriteSheet.communistArcherIdleFront,
    idleDownRight: GameSpriteSheet.communistArcherIdleFront,
    idleDownLeft: GameSpriteSheet.communistArcherIdleFront,
    runDown: GameSpriteSheet.communistArcherWalkFront,
    runDownLeft: GameSpriteSheet.communistArcherWalkFront,
    runDownRight: GameSpriteSheet.communistArcherWalkFront,
    idleUp: GameSpriteSheet.communistArcherIdleBack,
    idleUpRight: GameSpriteSheet.communistArcherIdleBack,
    idleUpLeft: GameSpriteSheet.communistArcherIdleBack,
    runUp: GameSpriteSheet.communistArcherWalkBack,
    runUpRight: GameSpriteSheet.communistArcherWalkBack,
    runUpLeft: GameSpriteSheet.communistArcherWalkBack,
  );

  SimpleDirectionAnimation capitalistArcher = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.capitalistArcherIdleRight,
    runRight: GameSpriteSheet.capitalistArcherWalkRight,
    idleLeft: GameSpriteSheet.capitalistArcherIdleLeft,
    runLeft: GameSpriteSheet.capitalistArcherWalkLeft,
    idleDown: GameSpriteSheet.capitalistArcherIdleFront,
    idleDownLeft: GameSpriteSheet.capitalistArcherIdleFront,
    idleDownRight: GameSpriteSheet.capitalistArcherIdleFront,
    runDown: GameSpriteSheet.capitalistArcherWalkFront,
    runDownLeft: GameSpriteSheet.capitalistArcherWalkFront,
    runDownRight: GameSpriteSheet.capitalistArcherWalkFront,
    idleUp: GameSpriteSheet.capitalistArcherIdleBack,
    idleUpLeft: GameSpriteSheet.capitalistArcherIdleBack,
    idleUpRight: GameSpriteSheet.capitalistArcherIdleBack,
    runUp: GameSpriteSheet.capitalistArcherWalkBack,
    runUpRight: GameSpriteSheet.capitalistArcherWalkBack,
    runUpLeft: GameSpriteSheet.capitalistArcherWalkBack,
  );

  SimpleDirectionAnimation loyalistArcher = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.loyalistArcherIdleRight,
    runRight: GameSpriteSheet.loyalistArcherWalkRight,
    idleLeft: GameSpriteSheet.loyalistArcherIdleLeft,
    runLeft: GameSpriteSheet.loyalistArcherWalkLeft,
    idleDown: GameSpriteSheet.loyalistArcherIdleFront,
    idleDownRight: GameSpriteSheet.loyalistArcherIdleFront,
    idleDownLeft: GameSpriteSheet.loyalistArcherIdleFront,
    runDown: GameSpriteSheet.loyalistArcherWalkFront,
    runDownLeft: GameSpriteSheet.loyalistArcherWalkFront,
    runDownRight: GameSpriteSheet.loyalistArcherWalkFront,
    idleUp: GameSpriteSheet.loyalistArcherIdleBack,
    idleUpLeft: GameSpriteSheet.loyalistArcherIdleBack,
    idleUpRight: GameSpriteSheet.loyalistArcherIdleBack,
    runUp: GameSpriteSheet.loyalistArcherWalkBack,
    runUpRight: GameSpriteSheet.loyalistArcherWalkBack,
    runUpLeft: GameSpriteSheet.loyalistArcherWalkBack,
  );

  SimpleDirectionAnimation loyalistKnight = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.loyalistKnightIdleRight,
    runRight: GameSpriteSheet.loyalistKnightWalkRight,
    idleLeft: GameSpriteSheet.loyalistKnightIdleLeft,
    runLeft: GameSpriteSheet.loyalistKnightWalkLeft,
    idleDown: GameSpriteSheet.loyalistKnightIdleFront,
    idleDownLeft: GameSpriteSheet.loyalistKnightIdleFront,
    idleDownRight: GameSpriteSheet.loyalistKnightIdleFront,
    runDown: GameSpriteSheet.loyalistKnightWalkFront,
    runDownLeft: GameSpriteSheet.loyalistKnightWalkFront,
    runDownRight: GameSpriteSheet.loyalistKnightWalkFront,
    idleUp: GameSpriteSheet.loyalistKnightIdleBack,
    idleUpRight: GameSpriteSheet.loyalistKnightIdleBack,
    idleUpLeft: GameSpriteSheet.loyalistKnightIdleBack,
    runUp: GameSpriteSheet.loyalistKnightWalkBack,
    runUpRight: GameSpriteSheet.loyalistKnightWalkBack,
    runUpLeft: GameSpriteSheet.loyalistKnightWalkBack,
  );

  SimpleDirectionAnimation getAnimations(CharacterClass classe, CharacterFaction faction) {
    switch (classe) {
      case CharacterClass.Knight:
        return getKnightAnimations(faction);
      case CharacterClass.Archer:
        return getArcherAnimations(faction);
      default:
        return getArcherAnimations(faction);

    }
  }
  
  SimpleDirectionAnimation getKnightAnimations(CharacterFaction faction) {
    switch (faction) {
      case CharacterFaction.Monarchist:
        return loyalistKnight;
      default:  
        return loyalistKnight;
    }
  }

  SimpleDirectionAnimation getArcherAnimations(CharacterFaction faction) {
    switch (faction) {
      case CharacterFaction.Communist:
        return communistArcher;
      case CharacterFaction.Capitalist:
        return capitalistArcher;
      case CharacterFaction.Monarchist:
        return loyalistArcher;
      default:
        return capitalistArcher;
    }
  }

class InterfaceSpriteSheet {
  //Tokens
  static Image get archerToken => Image.asset('assets/images/interface/archer_token.png');
  static Image get swordsmanToken => Image.asset('assets/images/interface/swordsman_token.png');
  static Image get knightToken => Image.asset('assets/images/interface/knight_token.png');
  //Vertentes Politicas
  static Image get communistSymbol => Image.asset('assets/images/interface/workers.png');
  static Image get monarchistSymbol => Image.asset('assets/images/interface/monarchists.png');
  static Image get capitalistSymbol => Image.asset('assets/images/interface/capitalists.png');
  //Title Screen
  static Image get titleScreen => Image.asset('assets/images/title.png');
  static Image get menuScreen => Image.asset('assets/images/menu_Screen.png');
  static Image get menuScreenNoLabels => Image.asset('assets/images/menu_Screen_NoLabels.png', fit: BoxFit.fill,);
  static Image get menuScreenDescription => Image.asset('assets/images/menu_Screen_description.png');
  static Image get workersBanner => Image.asset('assets/images/WorkersBanner.png');
  static Image get workersBannerSelected => Image.asset('assets/images/WorkersBannerSelected.png');
  static Image get ownersBannerDisabled => Image.asset('assets/images/OwnersBannerDisabled.png');
  static Image get ownersBanner => Image.asset('assets/images/OwnersBanner.png');
  static Image get ownersBannerSelected => Image.asset('assets/images/OwnersBannerSelected.png');
  static Image get loyalistsBannerDisabled => Image.asset('assets/images/LoyalistBannerDisabled.png');
  static Image get loyalistsBanner => Image.asset('assets/images/LoyalistBanner.png');
  static Image get loyalistsBannerSelected => Image.asset('assets/images/LoyalistBannerSelected.png');
  static Image get lindEasterEgg => Image.asset('assets/images/LindEasterEgg.png');
  //Life bar
  static List<Image> lifebarList = [
    Image.asset('assets/images/interface/lifebar/life_bar_1.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_2.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_3.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_4.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_5.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_6.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_7.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_8.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_9.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_10.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_11.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_12.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_13.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_14.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_15.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_16.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_17.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_18.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_19.png', height: 144,),
    Image.asset('assets/images/interface/lifebar/life_bar_20.png', height: 144,),
  ];
  //Interface elements
  static Image get coin => Image.asset('assets/images/interface/coin.png');
  static Image get people => Image.asset('assets/images/interface/people.png');
  
}

List<Widget> getToken(CharacterClass characterClass, CharacterFaction faction) {
  List<Widget> sideToken = [];
  if(characterClass == CharacterClass.Archer) {
    sideToken.add(InterfaceSpriteSheet.archerToken);
  }
  if(characterClass == CharacterClass.SwordsMan) {
    sideToken.add(InterfaceSpriteSheet.swordsmanToken);
  }
  if(characterClass == CharacterClass.Knight) {
    sideToken.add(InterfaceSpriteSheet.knightToken);
  }
  if(faction == CharacterFaction.Communist) {
    sideToken.add(InterfaceSpriteSheet.communistSymbol);
  }
  if(faction == CharacterFaction.Capitalist) {
    sideToken.add(InterfaceSpriteSheet.capitalistSymbol);
  }
  if(faction == CharacterFaction.Monarchist) {
    sideToken.add(InterfaceSpriteSheet.monarchistSymbol);
  }
  // sideToken.add(InterfaceSpriteSheet.interface);
  return sideToken;

}
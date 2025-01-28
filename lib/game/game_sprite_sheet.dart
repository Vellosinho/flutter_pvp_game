import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
// import 'package:flutter/material.dart';
import 'enum/character_class.dart';
import 'enum/character_faction.dart';


class GameSpriteSheet {
  // Communist Sprites

  // Blacksmith

  // One Time animations
  static Future<SpriteAnimation> get forgeSuccessful => SpriteAnimation.load(
    'communist/blacksmith/blacksmith_sword_complete.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.15, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get forgeLegedarySuccessful => SpriteAnimation.load(
    'communist/blacksmith/blacksmith_legendary_sword_complete.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.15, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get acquiredIron => SpriteAnimation.load(
    'communist/blacksmith/blacksmith_iron_acquired.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.15, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get equippingHammer => SpriteAnimation.load(
    'communist/blacksmith/blacksmith_equipping_hammer.png',
    SpriteAnimationData.sequenced(amount: 7, stepTime: 0.2, textureSize: Vector2(32, 40))
  );

  // Armed
  static Future<SpriteAnimation> get communistArmedBlacksmithShrug => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_shrug.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithIdleLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithIdleRight => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithIdleFront => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithIdleBack => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithWalkLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithDashLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_dash_left.png',
    SpriteAnimationData.sequenced(amount:4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithWalkRight => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithDashRight => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_dash_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithWalkFront => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithDashFront => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_dash_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithWalkBack => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithDashBack => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_dash_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmedBlacksmithSpinAttack => SpriteAnimation.load(
    'communist/blacksmith/armed/blacksmith_spin_attack.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );

  // Armored
  static Future<SpriteAnimation> get communistArmoredBlacksmithShrug => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_shrug.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithIdleLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithIdleRight => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithIdleFront => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithWalkLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithDashLeft => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_dash_left.png',
    SpriteAnimationData.sequenced(amount:4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithWalkRight => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithDashRight => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_dash_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithWalkFront => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.1, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistArmoredBlacksmithDashFront => SpriteAnimation.load(
    'communist/blacksmith/armed/armored/blacksmith_dash_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  
  // Unarmed
  static Future<SpriteAnimation> get communistUnarmedBlacksmithShrug => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_shrug.png',
    SpriteAnimationData.sequenced(amount: 8, stepTime: 0.2, textureSize: Vector2(32, 40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithIdleLeft => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_idle_left.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithIdleRight => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_idle_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithIdleFront => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_idle_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithIdleBack => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_idle_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.2, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithWalkLeft => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_walk_left.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithDashLeft => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_dash_left.png',
    SpriteAnimationData.sequenced(amount:4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithWalkRight => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_walk_right.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithDashRight => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_dash_right.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithWalkFront => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_walk_front.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithDashFront => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_dash_front.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithWalkBack => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_walk_back.png',
    SpriteAnimationData.sequenced(amount: 6, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  static Future<SpriteAnimation> get communistUnarmedBlacksmithDashBack => SpriteAnimation.load(
    'communist/blacksmith/unarmed/blacksmith_dash_back.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(32,40))
  );
  
  static Future<SpriteAnimation> get attackHorizontalRight => SpriteAnimation.load(
    'horizontal_attack_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get hammerAttackHorizontalRight => SpriteAnimation.load(
    'hammer_attack_right.png',
    SpriteAnimationData.sequenced(amount: 3, stepTime: 0.15, textureSize: Vector2(32,32))
  );
  static Future<SpriteAnimation> get hammerSpinAttack => SpriteAnimation.load(
    'hammer_spin_attack.png',
    SpriteAnimationData.sequenced(amount: 4, stepTime: 0.075, textureSize: Vector2(64,64))
  );
  
}


  SimpleDirectionAnimation spinningBlacksmithAttack = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleDown: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleDownRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleDownLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runDown: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runDownLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runDownRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleUp: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleUpRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    idleUpLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runUp: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runUpRight: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
    runUpLeft: GameSpriteSheet.communistArmedBlacksmithSpinAttack,
  );
  SimpleDirectionAnimation communistArmoredBlacksmith = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.communistArmoredBlacksmithIdleRight,
    runRight: GameSpriteSheet.communistArmoredBlacksmithWalkRight,
    idleLeft: GameSpriteSheet.communistArmoredBlacksmithIdleLeft,
    runLeft: GameSpriteSheet.communistArmoredBlacksmithWalkLeft,
    idleDown: GameSpriteSheet.communistArmoredBlacksmithIdleFront,
    idleDownRight: GameSpriteSheet.communistArmoredBlacksmithIdleFront,
    idleDownLeft: GameSpriteSheet.communistArmoredBlacksmithIdleFront,
    runDown: GameSpriteSheet.communistArmoredBlacksmithWalkFront,
    runDownLeft: GameSpriteSheet.communistArmoredBlacksmithWalkFront,
    runDownRight: GameSpriteSheet.communistArmoredBlacksmithWalkFront,
    idleUp: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    idleUpRight: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    idleUpLeft: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    runUp: GameSpriteSheet.communistArmedBlacksmithWalkBack,
    runUpRight: GameSpriteSheet.communistArmedBlacksmithWalkBack,
    runUpLeft: GameSpriteSheet.communistArmedBlacksmithWalkBack,
  );
  SimpleDirectionAnimation communistArmedBlacksmith = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.communistArmedBlacksmithIdleRight,
    runRight: GameSpriteSheet.communistArmedBlacksmithWalkRight,
    idleLeft: GameSpriteSheet.communistArmedBlacksmithIdleLeft,
    runLeft: GameSpriteSheet.communistArmedBlacksmithWalkLeft,
    idleDown: GameSpriteSheet.communistArmedBlacksmithIdleFront,
    idleDownRight: GameSpriteSheet.communistArmedBlacksmithIdleFront,
    idleDownLeft: GameSpriteSheet.communistArmedBlacksmithIdleFront,
    runDown: GameSpriteSheet.communistArmedBlacksmithWalkFront,
    runDownLeft: GameSpriteSheet.communistArmedBlacksmithWalkFront,
    runDownRight: GameSpriteSheet.communistArmedBlacksmithWalkFront,
    idleUp: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    idleUpRight: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    idleUpLeft: GameSpriteSheet.communistArmedBlacksmithIdleBack,
    runUp: GameSpriteSheet.communistArmedBlacksmithWalkBack,
    runUpRight: GameSpriteSheet.communistArmedBlacksmithWalkBack,
    runUpLeft: GameSpriteSheet.communistArmedBlacksmithWalkBack,
  );
  
  SimpleDirectionAnimation communistUnarmedBlacksmith = SimpleDirectionAnimation(
    idleRight: GameSpriteSheet.communistUnarmedBlacksmithIdleRight,
    runRight: GameSpriteSheet.communistUnarmedBlacksmithWalkRight,
    idleLeft: GameSpriteSheet.communistUnarmedBlacksmithIdleLeft,
    runLeft: GameSpriteSheet.communistUnarmedBlacksmithWalkLeft,
    idleDown: GameSpriteSheet.communistUnarmedBlacksmithIdleFront,
    idleDownRight: GameSpriteSheet.communistUnarmedBlacksmithIdleFront,
    idleDownLeft: GameSpriteSheet.communistUnarmedBlacksmithIdleFront,
    runDown: GameSpriteSheet.communistUnarmedBlacksmithWalkFront,
    runDownLeft: GameSpriteSheet.communistUnarmedBlacksmithWalkFront,
    runDownRight: GameSpriteSheet.communistUnarmedBlacksmithWalkFront,
    idleUp: GameSpriteSheet.communistUnarmedBlacksmithIdleBack,
    idleUpRight: GameSpriteSheet.communistUnarmedBlacksmithIdleBack,
    idleUpLeft: GameSpriteSheet.communistUnarmedBlacksmithIdleBack,
    runUp: GameSpriteSheet.communistUnarmedBlacksmithWalkBack,
    runUpRight: GameSpriteSheet.communistUnarmedBlacksmithWalkBack,
    runUpLeft: GameSpriteSheet.communistUnarmedBlacksmithWalkBack,
  );

  SimpleDirectionAnimation getAnimations(CharacterClass classe, CharacterFaction faction) {
    switch (classe) {
      case CharacterClass.Archer:
        return getArcherAnimations(faction);
      default:
        return getArcherAnimations(faction);

    }
  }

  SimpleDirectionAnimation getArcherAnimations(CharacterFaction faction) {
    switch (faction) {
      case CharacterFaction.Communist:
        return communistArmedBlacksmith;
      default:
        return communistArmedBlacksmith;
    }
  }

class InterfaceSpriteSheet {
  //Tokens
  static Image get archerToken => Image.asset('assets/images/interface/archer_token.png');
  static Image get swordsmanToken => Image.asset('assets/images/interface/swordsman_token.png');
  static Image get knightToken => Image.asset('assets/images/interface/knight_token.png');
  //Vertentes Politicas
  static Image get communistSymbol => Image.asset('assets/images/interface/workers.png', height: 128, width: 128, fit: BoxFit.cover);
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
  // static List<Image> lifebarList = [
  //   Image.asset('assets/images/interface/lifebar/life_bar_1.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_2.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_3.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_4.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_5.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_6.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_7.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_8.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_9.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_10.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_11.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_12.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_13.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_14.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_15.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_16.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_17.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_18.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_19.png', height: 144,),
  //   Image.asset('assets/images/interface/lifebar/life_bar_20.png', height: 144,),
  // ];
  static Image get inventoryBar => Image.asset('assets/images/interface/inventoryBar/inventory_bar.png',height: 88, fit: BoxFit.cover,);
  static Image get lifeBar => Image.asset('assets/images/interface/lifebar/lifebar.png',height: 152, fit: BoxFit.cover,);
  // static Image get miniMapDecoration => Image.asset('assets/images/interface/minimap/minimap.png',height: 340, fit: BoxFit.cover,);
  static Image get miniMapDecoration => Image.asset('assets/images/interface/minimap/complete_minimap_interface.png',height: 360, fit: BoxFit.cover,);
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
    sideToken.add(Padding(
      padding: const EdgeInsets.all(4),
      child: InterfaceSpriteSheet.swordsmanToken,
    ));
  }
  if(characterClass == CharacterClass.Knight) {
    sideToken.add(InterfaceSpriteSheet.knightToken);
  }
  if(faction == CharacterFaction.Communist) {
    sideToken.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: InterfaceSpriteSheet.communistSymbol,
    ));
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

class MinigameInterface {
  static Image get minigameBackground => Image.asset('assets/images/minigame/minigame.png',height: 400, fit: BoxFit.cover,);
  static Image get minigameDecoration => Image.asset('assets/images/minigame/minigame_decoration.png',height: 400, fit: BoxFit.cover,);
}

class BackgroundImages {
  static String get clouds => 'background/clouds_background.png';
}

class ItemSprites {
  static Image get swordIcon => Image.asset('assets/images/items/forged_sword.png', height: 64, fit: BoxFit.cover);
  static Image get legendarySwordIcon => Image.asset('assets/images/items/legendary_sword.png', height: 64, fit: BoxFit.cover);
  static Image get ironBarIcon => Image.asset('assets/images/items/iron_bar.png', height: 64, fit: BoxFit.cover);
}
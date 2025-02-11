import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class PlayerOneAnimations {

  PlayerOneAnimations();

  FutureOr<SpriteAnimation> getArmedAnimation(String direction) {
      switch (direction) {
        case '3.141592653589793':
          return GameSpriteSheet.communistArmedBlacksmithDashLeft;
        case '1.7453292519943295e-9':
          return GameSpriteSheet.communistArmedBlacksmithDashRight;
        case '-0.7853981633974483':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '2.356194490192345':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        case '-2.356194490192345':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '0.7853981633974483':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        case '-1.5707963267948966':
          return GameSpriteSheet.communistArmedBlacksmithDashBack;
        case '1.5707963267948966':
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
        default:
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
      }
    }

    FutureOr<SpriteAnimation> getUnarmedAnimation(String direction) {
      switch (direction) {
        case '3.141592653589793':
          return GameSpriteSheet.communistUnarmedBlacksmithDashLeft;
        case '1.7453292519943295e-9':
          return GameSpriteSheet.communistUnarmedBlacksmithDashRight;
        case '-0.7853981633974483':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '2.356194490192345':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        case '-2.356194490192345':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '0.7853981633974483':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        case '-1.5707963267948966':
          return GameSpriteSheet.communistUnarmedBlacksmithDashBack;
        case '1.5707963267948966':
          return GameSpriteSheet.communistUnarmedBlacksmithDashFront;
        default:
          return GameSpriteSheet.communistArmedBlacksmithDashFront;
      }
    }
 

  
}
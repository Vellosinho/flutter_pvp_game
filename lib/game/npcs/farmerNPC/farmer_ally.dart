import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class FarmerAlly extends SimpleAlly {
  Vector2 hitboxSize;
  Vector2 hitboxPosition;
  LocalGameController controller;
  FarmerAlly({
    required Vector2 position,  
    required Vector2 size,
    required this.hitboxSize,
    required this.hitboxPosition,
    required this.controller,
  }) : super(
    position: position,
    size: size,
    speed: PlayerConsts.npcSpeed,
    initDirection: Direction.down,
    animation: CommunistFarmerNPCSprites().communistFarmerAnimations,
    receivesAttackFrom: AcceptableAttackOriginEnum.ENEMY
    );

    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size: hitboxSize, position: hitboxPosition));
      // seeAndMoveToAttackRange();
      return super.onLoad();
    }

    @override
    void update(double dt) {
      // seeAndMoveToEnemy(radiusVision: 6000, margin: 100, closeEnemy: (Enemy ) { 
      //   simpleAttackMelee(
      //     sizePush: 0.2,
      //     damage: 5,
      //     size: size * 1.15,
      //     animationRight: GameSpriteSheet.attackHorizontalRight,
      //     direction: lastDirection,
      //   );
      //  });
      seeAndMoveToPlayer(radiusVision: 6000, margin: 100);
      super.update(dt);
    }

}
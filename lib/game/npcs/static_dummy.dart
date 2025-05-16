import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game.dart';
import 'package:projeto_gbb_demo/game/npcs/npcs_sprite_sheet.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

class StaticDummy extends SimpleEnemy with BlockMovementCollision {
  int hitCount = 0;

  SimpleDirectionAnimation dummyAnimations = SimpleDirectionAnimation(
    idleDown: NPCSprites.dummyStand,
    idleRight: NPCSprites.dummyStand,
    runRight: NPCSprites.dummyStand,
  );

  SimpleDirectionAnimation emptyAnimations = SimpleDirectionAnimation(
    idleDown: NPCSprites.empty,
    idleRight: NPCSprites.empty,
    runRight: NPCSprites.empty,
  );

  StaticDummy({
    required super.position,
  }) : super(
          size: PlayerConsts.npcSize,
          speed: 0,
          animation: SimpleDirectionAnimation(
            idleDown: NPCSprites.empty,
            idleRight: NPCSprites.empty,
            runRight: NPCSprites.empty,
          ),
        );

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(
      size: PlayerConsts.characterHitbox,
      position: PlayerConsts.hitboxPosition,
    ));

    replaceAnimation(dummyAnimations);
    Future.delayed(Duration(milliseconds: 20), () {
      animation?.playOnce(NPCSprites.dummyCreate);
    });

    return super.onLoad();
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    // gameRef.camera.shake(intensity: 6);
    // handleZoom(minZoom);
    animation?.playOnce(NPCSprites.dummyHit);

    print(damageType);
    // if(hitCount < 4) {
    //   TalkDialog.show(context, dummyTutorial(), style: const TextStyle(fontFamily: 'PressStart2P', fontSize: 24, height: 1.5));
    //   hitCount++;
    // }
    super.onReceiveDamage(attacker, damage, identify, damageType);
  }

  @override
  void onDie() {
    animation?.playOnce(NPCSprites.dummyBreak);
    Future.delayed(Duration(seconds: 1), () {
      gameRef.add(StaticDummy(position: Vector2(tileSize * 21, tileSize * 11)));
      removeFromParent();
    });
    super.onDie();
  }
}

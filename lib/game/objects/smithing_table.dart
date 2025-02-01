import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/controller/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class SmithingTable extends GameDecoration with Attackable {
  LocalGameController localGameController;
  bool _hasHammer = true;
  SmithingTable({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.smithingTableHammer, position: position, size: Vector2(192, 384)) 
      // : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(96, 96)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(168, 264), position: Vector2(24, 80),));
      return super.onLoad();
    }

    @override
  void update(double dt) {
    super.update(dt);
  }

  Future<void> updateSprite() async {
    sprite = await GameObjectsSprites.smithingTableEmpty;
  }

    @override
    void onReceiveDamage(attacker, double damage, identify) {
      if(_hasHammer) {
        updateSprite();
        localGameController.getWeapon();
        _hasHammer = false;
      }
      // updateAnvilSprite();
      super.onReceiveDamage(attacker, 0.0, identify);
    }

    
}
import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class Furnace extends GameDecoration with Attackable {
  LocalGameController localGameController;
  Furnace({
    required super.position,required this.localGameController})
      : super.withAnimation(animation: GameObjectsSprites.activeFurnace, size: Vector2(384, 1152)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(324, 192), position: Vector2(24, 932),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt);
    }
    
    @override
    void onReceiveDamage(attacker, double damage, identify) {
      localGameController.getIron();
      super.onReceiveDamage(attacker, 0.0, identify);
    }
} 
import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';

import 'game_sprite_sheet.dart';

class Anvil extends GameDecoration with Attackable {
  LocalGameController localGameController;
  Anvil({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(128, 128)) 
    {
    }
    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(128, 64), position: Vector2(0, 64),));
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt);
    }
    
    @override
    void onReceiveDamage(attacker, double damage, identify) {
      localGameController.minigameIsActive ? localGameController.miniGameHit() : localGameController.startMinigame();
      super.onReceiveDamage(attacker, 0.0, identify);
    }
} 
import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

import 'game_sprite_sheet.dart';

class Anvil extends GameDecoration with ObjectCollision, Attackable {
  LocalGameController localGameController;
  Anvil({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(128, 128)) 
    {
      setupCollision(
        CollisionConfig(collisions: [
          CollisionArea.rectangle(
            size: Vector2(128, 64),
            align: Vector2(0, 64),
          )
        ])
      );
    }
    @override
    void update(double dt) {
        // do anything
        super.update(dt);
    }
    
    @override
    void receiveDamage(AttackFromEnum attacker, double damage, identify) {
      localGameController.minigameIsActive ? localGameController.miniGameHit() : localGameController.startMinigame();
    }
} 
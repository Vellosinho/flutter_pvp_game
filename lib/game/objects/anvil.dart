import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class Anvil extends GameDecoration with Attackable {
  LocalGameController localGameController;
  Anvil({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(144, 144)) 
      // : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(96, 96)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(144, 64), position: Vector2(0, 80),));
      return super.onLoad();
    }

    Future<void> updateAnvilSprite() async {
      if(localGameController.minigameIsActive) {
        if (localGameController.swordScore < 50) {
          sprite = await GameObjectsSprites.anvilFirstHit;
        } else if (localGameController.swordScore < 100) {
          sprite = await GameObjectsSprites.anvilSecondHit;
        } else if (localGameController.swordScore < 150) {
          sprite = await GameObjectsSprites.anvilThirdHit;
        } else if (localGameController.swordScore < 200) {
          sprite = await GameObjectsSprites.anvilFourthHit;
        } else if (localGameController.swordScore < 250) {
          sprite = await GameObjectsSprites.anvilFifthHit;
        }
      } else {
        sprite = await GameObjectsSprites.anvil;
      }
    }

    @override
  void update(double dt) {
    updateAnvilSprite();
    super.update(dt);
  }
    
    @override
    void onReceiveDamage(attacker, double damage, identify) {
      localGameController.minigameIsActive ? localGameController.miniGameHit() : localGameController.startMinigame(position);
      // updateAnvilSprite();
      super.onReceiveDamage(attacker, 0.0, identify);
    }

    
}
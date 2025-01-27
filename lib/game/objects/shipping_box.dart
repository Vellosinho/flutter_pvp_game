
import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';
import 'package:projeto_gbb_demo/game/items/sword_item.dart';

class SwordShippingBox extends GameDecoration with Attackable {
  LocalGameController localGameController;
  SwordShippingBox({
    required Vector2 position,required this.localGameController})
      : super.withSprite(sprite: GameObjectsSprites.swordShippingBoxEmpty, position: position, size: Vector2(192, 192)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(192, 128), position: Vector2(0, 64),));
      return super.onLoad();
    }

    List<Sword> swordsInBox = [];
    
    @override
    void onReceiveDamage(attacker, double damage, identify) {
      putSwordInBox();
      super.onReceiveDamage(attacker, 0.0, identify);
    }

    void putSwordInBox() {
      Item? sword = localGameController.getFirstOfType(Sword(isLegenday: false));
      if (swordsInBox.length > 3) {
        clearBox();
      } else {
        if(sword != null) {
          swordsInBox.add(sword as Sword);
          localGameController.removeFromInventory(sword);
          updateShippingBoxSprite();
        } else {
          if (swordsInBox.isNotEmpty) {
            clearBox();
          } else {
            localGameController.shrugPlayer(); 
        }}
      }
    }

    void clearBox() {
      int totalPoints = 0;

      for (int i = 0; i < swordsInBox.length; i++) {
        totalPoints += (swordsInBox[i].isLegenday) ? 50 : 25;
      }

      localGameController.getMoney(totalPoints);

      swordsInBox.clear();
      updateShippingBoxSprite();
      return;
    }

    Future<void> updateShippingBoxSprite() async {
      switch (swordsInBox.length) {
        case 1:
          sprite = await GameObjectsSprites.swordShippingBoxOne;
          break;
        case 2:
          sprite = await GameObjectsSprites.swordShippingBoxTwo;
          break;
        case 3:
          sprite = await GameObjectsSprites.swordShippingBoxThree;
          break;
        case 4:
          sprite = await GameObjectsSprites.swordShippingBoxFour;
          break;
        default:
          sprite = await GameObjectsSprites.swordShippingBoxEmpty;
          break;
      }
    }
}
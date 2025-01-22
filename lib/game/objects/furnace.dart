import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/game_controller.dart';
import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';

class Furnace extends GameDecoration with Attackable {
  LocalGameController localGameController;
  int stashedIron = 0;
  Furnace({
    required super.position,required this.localGameController})
      : super.withAnimation(animation: GameObjectsSprites.activeFurnace, size: Vector2(384, 1152)) 
;    @override
    Future<void> onLoad() {
      add(RectangleHitbox(size:Vector2(324, 192), position: Vector2(24, 932),));
      initFurnace();
      return super.onLoad();
    }

    @override
    void update(double dt) {
        // do anything
        super.update(dt); 
    }
     //  Furnace functions:

    void initFurnace() {
      Future.delayed(Duration(seconds: 15), () {
        produceIron();
      });
    }

    void produceIron() {
      if(stashedIron < 5) {
        stashedIron++;
      }
      Future.delayed(Duration(seconds: 15), () {
        produceIron();
      });
    }
  
    
    @override
    void onReceiveDamage(attacker, double damage, identify) {
      bool gotIron = localGameController.getIron(stashedIron);
      if (gotIron) {
        stashedIron--;
      }
      super.onReceiveDamage(attacker, 0.0, identify);
    }
} 
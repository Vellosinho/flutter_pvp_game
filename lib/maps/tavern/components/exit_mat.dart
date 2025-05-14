import 'package:bonfire/bonfire.dart';
import 'package:projeto_gbb_demo/game/objects/object_sprites.dart';

class ExitMat extends GameDecoration with Attackable {
  Function exitFunction;
  ExitMat({required super.position, required this.exitFunction})
      : super.withSprite(
            sprite: GameObjectsSprites.yellowMat, size: Vector2(192, 192))
  // : super.withSprite(sprite: GameObjectsSprites.ExitMat, position: position, size: Vector2(96, 96))
  ;
  @override
  Future<void> onLoad() async {
    add(RectangleHitbox(
      size: Vector2(144, 64),
      position: Vector2(0, 80),
    ));
    // final program = await FragmentProgram.fromAsset('shaders/myshader.frag');
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onReceiveDamage(attacker, double damage, identify, damageType) {
    exitFunction();
    // updateExitMatSprite();
    super.onReceiveDamage(attacker, 0.0, identify, damageType);
  }
}

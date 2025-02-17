import 'package:bonfire/bonfire.dart';

class LitPlayer extends SimplePlayer with Lighting {
  LitPlayer({
    required Vector2 position,
    required Vector2 size,
    SimpleDirectionAnimation? animation,
    Direction initDirection = Direction.right,
    double? speed,
    double life = 100,
  }) : super(
          position: position,
          size: size,
          life: life,
          speed: speed,
        ) {
    this.animation = animation;
    lastDirection = initDirection;
  }
}

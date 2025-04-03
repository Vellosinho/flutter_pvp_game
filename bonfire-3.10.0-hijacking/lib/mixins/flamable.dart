import 'dart:math';
import 'package:bonfire/bonfire.dart';

/// Mixin responsible for adding damage-taking behavior to the component.
mixin Flamable on Lighting {
  /// Used to define which type of component can be damaged

  bool _isBurnt = false;
  bool get isBurnt => _isBurnt;

  int _spreadCount = 10;
  int get spreadCount => _spreadCount;

  final bool _isInFlames = false;
  bool get isInFlames => _isInFlames;

  Random rand = Random();

  @override
  Future<void> onLoad() {
    setupLighting(
      LightingConfig(
        radius: 0,
        color: const Color(0xffea5c0a).withAlpha(80),
        // color: Color(0xff9dc1e8).withAlpha(80),
        blurBorder: 160,
        align: Vector2(0, 128),
      ),
    );
    return super.onLoad();
  }

  void setFire() {
    if (!_isInFlames) {
      setupLighting(
        LightingConfig(
          radius: width * 1.2,
          color: const Color(0xffea5c0a).withAlpha(80),
          // color: Color(0xff9dc1e8).withAlpha(80),
          blurBorder: 160,
          align: Vector2(0, 128),
        ),
      );
      Future.delayed(const Duration(seconds: 5), () {
        fireSpread();
      });
    }
  }

  void fireSpread() {
    if (_spreadCount > 0) {
      int chance = rand.nextInt(10);
      if (chance > 8) {
        simpleAttackMeleeByAngle(
          centerOffset: Vector2(-96, -96),
          // sizePush: 0.2,
          withPush: false,
          damage: 5,
          angle: 0,
          attackFrom: AttackOriginEnum.WORLD,
          size: Vector2(384, 384),
          damageType: DamageType.FIRE,
        );
      }
      _spreadCount--;
      Future.delayed(const Duration(seconds: 5), () {
        fireSpread();
      });
    } else {
      onBurn();
    }
  }

  void onBurn() {
    _isBurnt = true;
    setupLighting(
      LightingConfig(
        radius: 0,
        color: const Color(0xffea5c0a).withAlpha(80),
        // color: Color(0xff9dc1e8).withAlpha(80),
        blurBorder: 160,
        align: Vector2(0, 128),
      ),
    );
  }

  // Called when the component dies

  // Get rect collision of the component used to receive damage
  Rect rectAttackable() => rectCollision;
}

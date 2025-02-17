import 'dart:ui';

import 'package:bonfire/mixins/attackable.dart';

class ElementColors{
  static const Color fireColor = Color(0xffea5c0a);
  static const Color thunderColor = Color(0xff9dc1e8);


  Color getElementColor(DamageType damageType) {
    switch (damageType) {
      case DamageType.FIRE:
        return fireColor;
      case DamageType.THUNDER:
        return thunderColor;
      default:
        return fireColor;
    }

  }
}
import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';

import 'game_sprite_sheet.dart';

class Anvil extends GameDecoration {
  Anvil(Vector2 position)
      : super.withSprite(sprite: GameObjectsSprites.anvil, position: position, size: Vector2(128, 128));

    @override
    void update(double dt) {
        // do anything
        super.update(dt);
    }
}
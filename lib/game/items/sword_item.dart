import 'package:projeto_gbb_demo/game/game_sprite_sheet.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';

class Sword extends Item{
  bool isLegenday;

  Sword({required this.isLegenday,}) : super(name: 'sword', assetPath: isLegenday ? ItemSprites.legendarySwordIcon : ItemSprites.swordIcon);
}
import 'package:bonfire/bonfire.dart';

class BaseAction {
  Vector2 position;
  SimpleDirectionAnimation newAnimation;

  BaseAction({required this.position, required this.newAnimation});
}
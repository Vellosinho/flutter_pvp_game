import 'package:bonfire/bonfire.dart';

class Message {
  Message({
    required this.idPlayer,
    required this.action,
    required this.direction,
    this.position,
  });

  final String idPlayer;
  final String action;
  final String direction;
  final Vector2? position;

  Map<String, dynamic> toJson() {
    return {
      'id': idPlayer,
      'action': action,
      'direction': direction,
      'position': position != null
          ? {
              'x': position!.x,
              'y': position!.y,
            }
          : null,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        idPlayer: json['id'],
        action: json['action'],
        direction: json['direction'],
        position: json['position'] != null
            ? Vector2(
                double.parse(json['position']['x'].toString()),
                double.parse(json['position']['y'].toString()),
              )
            : null,
      );
}

class ActionMessage {
  static const String previouslyEnemyConnected = "PREVIOUSLY_CONNECTED";
  static const String enemyInvocation = "ENEMY_INVOCATION";
  static const String move = "MOVE";
  static const String idle = "IDLE";
  static const String attack = "ATTACK";
  static const String disconnect = "DISCONNECT";
}

class DirectionMessage {
  static const String right = "RIGHT";
  static const String left = "LEFT";
  static const String up = "UP";
  static const String upRight = '$up$right';
  static const String upLeft = '$up$left';
  static const String down = "DOWN";
  static const String downRight = '$down$right';
  static const String downLeft = '$down$left';

  static String direction(Direction direction) {
    if (direction == Direction.up) {
      return up;
    }
    if (direction == Direction.down) {
      return down;
    }
    if (direction == Direction.right) {
      return right;
    }
    if (direction == Direction.downRight) {
      return downRight;
    }
    if (direction == Direction.upRight) {
      return upRight;
    }
    if (direction == Direction.left) {
      return left;
    }
    if (direction == Direction.downLeft) {
      return downLeft;
    }
    if (direction == Direction.upLeft) {
      return upLeft;
    }
    return right;
  }
}

extension DirectionToDirectionMessage on String {
  toDirection() {
    if (this == DirectionMessage.up) {
      return Direction.up;
    }
    if (this == DirectionMessage.down) {
      return Direction.down;
    }
    if (this == DirectionMessage.right) {
      return Direction.right;
    }
    if (this == DirectionMessage.downRight) {
      return Direction.downRight;
    }
    if (this == DirectionMessage.upRight) {
      return Direction.upRight;
    }
    if (this == DirectionMessage.left) {
      return Direction.left;
    }
    if (this == DirectionMessage.downLeft) {
      return Direction.downLeft;
    }
    if (this == DirectionMessage.upLeft) {
      return Direction.upLeft;
    }
    return DirectionMessage.right;
  }
}

import 'package:bonfire/bonfire.dart';

class Message {
  Message({
    required this.playerId,
    required this.action,
    required this.direction,
    this.position,
  });

  final String playerId;
  final String action;
  final String direction;
  final Vector2? position;

  Map<String, dynamic> toMap() {
    return {
      'id': playerId,
      'action': action,
      'direction': direction,
      'position': position != null ?
        {
          'x': position!.x,
          'y': position!.y,
        } : null,
    };
  }

  factory Message.fromMap(Map<String, dynamic> json) => Message(
    playerId: json['id'],
    action: json['action'],
    direction: json['direction'],
    position: json['position'] != null ?
      Vector2(
        double.parse(json['position']['x'].toString()),
        double.parse(json['position']['y'].toString()),
      ) : null,
  );
}

class ActionMessage {
  static const String previouslyEnemyConnected = "PREVIOUSLY_CONNECTED";
  static const String enemyInvocation = "ENEMY_INVOCATION";
  static const String move = "MOVE";
}

class DirectionMessage {
  static const String right = "RIGHT";
  static const String left = "LEFT";
  static const String up = "UP";
  static const String upRight = "UPRIGHT";
  static const String upLeft = "UPLEFT";
  static const String down = "DOWN";
  static const String downRight = "DOWNRIGHT";
  static const String downLeft = "DOWNLEFT";

  static String direction(Direction direction) {
    switch (direction) {
      case Direction.up:
        return up;
      case Direction.down:
        return down;
      case Direction.left:
        return left;
      case Direction.right:
        return right;
      case Direction.upLeft:
        return upLeft;
      case Direction.upRight:
        return upRight;
      case Direction.downLeft:
        return downLeft;
      case Direction.downRight:
        return downRight;
      default:
        return right;
    }
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
    if (this == DirectionMessage.left) {
      return Direction.left;
    }
    if (this == DirectionMessage.right) {
      return Direction.right;
    }
    if (this == DirectionMessage.upRight) {
      return Direction.upRight;
    }
    if (this == DirectionMessage.upLeft) {
      return Direction.upLeft;
    }
    if (this == DirectionMessage.downRight) {
      return Direction.downRight;
    }
    if (this == DirectionMessage.downLeft) {
      return Direction.downLeft;
    }
  }
}
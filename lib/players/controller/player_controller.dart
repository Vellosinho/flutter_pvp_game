import 'package:bonfire/bonfire.dart';
import '../../services/message_service.dart';
import '../player_one.dart';

class PlayerController extends StateController<PlayerOne> {
  final MessageService messageService;

  PlayerController({
    required this.messageService,
  });

  @override
  void update(double dt, PlayerOne component) {}

  // onAttack() {
  //   messageService.send(Message(
  //     idPlayer: component!.id,
  //     action: ActionMessage.attack,
  //     direction: DirectionMessage.direction(component!.lastDirection),
  //   ));
  // }

  // onMove(double speed, Direction direction) {
  //   if (speed > 0) {
  //     messageService.send(
  //       Message(
  //         idPlayer: component!.id,
  //         action: ActionMessage.move,
  //         direction: DirectionMessage.direction(direction),
  //         position: Vector2(component!.x, component!.y),
  //       ),
  //     );
  //   } else {
  //     idleAction(direction);
  //   }
  // }

  // void idleAction(Direction direction) {
  //   messageService.send(
  //     Message(
  //       idPlayer: component!.id,
  //       action: ActionMessage.idle,
  //       direction: DirectionMessage.direction(direction),
  //       position: Vector2(component!.x, component!.y),
  //     ),
  //   );
  // }
}

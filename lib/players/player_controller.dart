import 'package:bonfire/bonfire.dart';
import 'package:bonfire/state_manager/state_controller.dart';
import 'package:bonfire/util/direction.dart';
import 'package:projeto_gbb_demo/firebase/mesaging_service.dart';
import 'package:projeto_gbb_demo/models/message.dart';
import 'package:projeto_gbb_demo/players/player_one.dart';

class PlayerController extends StateController<PlayerOne> {
  final DatabaseService messageService;

  PlayerController({required this.messageService});
  @override
  void update(double dt, PlayerOne component) {
    // TODO: implement update
  }

  onMove(double speed, Direction direction) {
    if(speed > 0) {
      messageService.sendMessage('Cuca@teste.com',
        Message(playerId: 'Cuca@teste.com',
        action: ActionMessage.move,
        direction: DirectionMessage.direction(direction),
        position: Vector2(component!.x, component!.y),
      ));
    }
  }

}
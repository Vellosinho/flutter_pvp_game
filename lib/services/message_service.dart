import 'package:projeto_gbb_demo/services/websocket_service.dart';

import '../entities/message.dart';

class MessageService {
  MessageService({
    required this.websocket,
  });

  final WebsocketService websocket;
  final List<Function(Message)> _onActions = [];

  void send(Message action) {
    websocket.sendMessage(action.toJson());
  }

  void onListen(
    String action,
    Function(Message) onUpdateAction,
  ) {
    _onActions.add(((message) {
      if (message.action == action) {
        onUpdateAction(message);
      }
    }));
  }

  void init() async {
    await websocket.initConnection();
    await websocket.broadcastNotifications(onReceive: (json) {
      final message = Message.fromJson(json);
      for (var onAction in _onActions) {
        onAction(message);
      }
    });
  }

  void dispose() async {
    await websocket.disconnect();
  }
}

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game/game_controller.dart';
import 'services/message_service.dart';
import 'services/websocket_service.dart';
import 'starter.dart';

const double tileSize = 32;

void main() {
  final websocket = WebsocketService();
  BonfireInjector.instance.put((i) => websocket);
  BonfireInjector.instance.put((i) => MessageService(websocket: i.get()));
  // BonfireInjector.instance.put(
  //   (i) => PlayerController(messageService: i.get()),
  // );
  // BonfireInjector.instance.putFactory(
  //   (i) => EnemyPlayerController(messageService: i.get()),
  // );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalGameController(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Starter(),
      ),
    ),
  );
}

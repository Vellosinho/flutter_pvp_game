import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:projeto_gbb_demo/screens/title_screen.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'game/game_controller.dart';
import 'services/message_service.dart';
import 'services/websocket_service.dart';
import 'package:bonfire/util/game_controller.dart';
import 'starter.dart';

const double tileSize = 32;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // windowManager.waitUntilReadyToShow().then((_) async {
// Hide window title bar
  // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  // await windowManager.setFullScreen(true);
  // await windowManager.center();
  // await windowManager.show();
  // await windowManager.setSkipTaskbar(false);
  // });
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
        ChangeNotifierProvider(create: (_) => LocalGameController(),),
        ChangeNotifierProvider(create: (_) => PlayerConsts(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Starter(),
      ),
    ),
  );
}

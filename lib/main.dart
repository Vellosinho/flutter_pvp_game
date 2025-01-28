import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:provider/provider.dart';
// import 'package:window_manager/window_manager.dart';
import 'game/game_controller.dart';
import 'game.dart';

const double tileSize = 32;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  // await windowManager.setFullScreen(true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalGameController(),),
        ChangeNotifierProvider(create: (_) => PlayerConsts(),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Game(),
      ),
    ),
  );
}

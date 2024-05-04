import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_gbb_demo/firebase/auth_service.dart';
import 'package:projeto_gbb_demo/firebase/utils.dart';
import 'package:projeto_gbb_demo/players/player_consts.dart';
import 'package:provider/provider.dart';
import 'game/game_controller.dart';
import 'game.dart';

const double tileSize = 32;

void main() async {
  await initialSetup();
  final GetIt _getIt = GetIt.instance;
  final AuthService _authService =_getIt.get<AuthService>();
  bool result = await _authService.login();
  if(result = true) {
    print("Logado com sucesso");
  } else {
    print("Falha no login");
  }

  // await FirebaseApi().initNotifications();
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

Future<void> initialSetup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupFirebase();
  await registerServices();
}

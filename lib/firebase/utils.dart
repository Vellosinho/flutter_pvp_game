import 'package:bonfire/bonfire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_gbb_demo/firebase/auth_service.dart';
import 'package:projeto_gbb_demo/firebase/mesaging_service.dart';
import 'package:projeto_gbb_demo/firebase_options.dart';
import 'package:projeto_gbb_demo/players/player_controller.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<PlayerController>(PlayerController(messageService: DatabaseService()));
  BonfireInjector.instance.put((i) => DatabaseService());
  BonfireInjector.instance.put((i) => PlayerController(messageService: i.get()));
}
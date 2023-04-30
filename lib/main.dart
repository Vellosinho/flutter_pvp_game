import 'dart:io';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/character_faction.dart';
import 'package:projeto_gbb_demo/game_sprite_sheet.dart';
import 'package:projeto_gbb_demo/player.dart';
import 'package:projeto_gbb_demo/player_interface.dart';
import 'package:provider/provider.dart';

import 'character_class.dart';
import 'npc_definitions.dart';
import 'game_controller.dart';

//PlatformChecking
bool isPhone = _platformIsPhone();
double tileSize = isPhone ? 96 : 192 ;
Vector2 characterSize = isPhone ? Vector2(96, 96) : Vector2(192, 192);
// Vector2 characterSize = isPhone ? Vector2(64, 64) : Vector2(128, 128);
Vector2 characterHitbox = isPhone ? Vector2(48, 20) : Vector2(96, 40);
Vector2 hitboxPosition = isPhone ? Vector2(24, 80) : Vector2(48,160);
double characterSpeed = isPhone ? 200 : 400;
const CharacterFaction playerFaction = CharacterFaction.Monarchist;

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocalGameController(),)
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, JoystickController? joystick}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    // final GameController gameController = Provider.of<GameController>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SimpleDirectionAnimation characterAnimations = getArcherAnimations(playerFaction);
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
        lightingColorGame: Colors.amber[400]!.withAlpha(8),
        // lightingColorGame: Colors.red[900]!.withAlpha(8),
        components: [
          StaticDummy(hitboxPosition: hitboxPosition, hitboxSize: characterHitbox, size: characterSize, position: Vector2(tileSize * 9.5, tileSize * 20,), 
            minZoom: 0.8,
            controller: context.read<LocalGameController>(),
            onHit: () {
              // context.read<LocalGameController>().hit(2);
              context.read<LocalGameController>().getMoney(7);
              context.read<LocalGameController>().addHitCount();
          })
        ],  
        // interface: PlayerInterface(),
        cameraConfig: CameraConfig(smoothCameraEnabled: true, smoothCameraSpeed: 2, zoom: 0.8),
        joystick:
            Joystick(keyboardConfig: 
              KeyboardConfig(acceptedKeys: [
                LogicalKeyboardKey.arrowDown,
                LogicalKeyboardKey.arrowLeft,
                LogicalKeyboardKey.arrowUp,
                LogicalKeyboardKey.arrowRight,
                LogicalKeyboardKey.keyZ
              ] 
            )
          ),
        map: WorldMapByTiled('map/map.json', forceTileSize: Vector2(tileSize, tileSize)),
        player: FighterPlayer(
          playerLife: context.watch<LocalGameController>().playerLife.toDouble(),
          onHit: () {
            context.read<LocalGameController>().hit(2);
          },
          faction: playerFaction,
          position: Vector2(tileSize * 9.5, tileSize * 22.5),
          size: characterSize,
          characterSpeed: characterSpeed,
          hitboxSize: characterHitbox,
          hitboxPosition: hitboxPosition,
          animations: characterAnimations,
        ),
        overlayBuilderMap: {
          PlayerInterface.overlayKey: (context,game) => const PlayerInterface(characterClass: CharacterClass.SwordsMan, characterFaction: playerFaction),
        },
        initialActiveOverlays: const [
          PlayerInterface.overlayKey,
        ],
    );
      // showCollisionArea: true,
  }
}

bool _platformIsPhone() {
  bool platformIsDesktop = (!kIsWeb)
      ? (Platform.isAndroid || Platform.isIOS)
          ? true
          : false
      : false;
  return platformIsDesktop;
}
import 'dart:io';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/player.dart';
import 'package:projeto_gbb_demo/player_interface.dart';

//PlatformChecking
bool isPhone = _platformIsPhone();
double tileSize = isPhone ? 96 : 192 ;
Vector2 characterSize = isPhone ? Vector2(96, 96) : Vector2(192, 192);
// Vector2 characterSize = isPhone ? Vector2(64, 64) : Vector2(128, 128);
Vector2 characterHitbox = isPhone ? Vector2(48, 20) : Vector2(96, 40);
Vector2 hitboxPosition = isPhone ? Vector2(24, 80) : Vector2(48,160);
double characterSpeed = isPhone ? 200 : 400;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, JoystickController? joystick}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      interface: GameInterface(),
      cameraConfig: CameraConfig(smoothCameraEnabled: true, smoothCameraSpeed: 4),
      joystick: !isPhone 
          ? Joystick(keyboardConfig: KeyboardConfig(keyboardDirectionalType: KeyboardDirectionalType.arrows))
          : Joystick(
              directional: JoystickDirectional(color: Colors.white),
            ),
      map: WorldMapByTiled('map/map.json', forceTileSize: Vector2(tileSize, tileSize)),
      player: FighterPlayer(
        position: Vector2(tileSize * 7, tileSize * 8),
        size: characterSize,
        characterSpeed: characterSpeed,
        hitboxSize: characterHitbox,
        hitboxPosition: hitboxPosition,
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context,game) => const PlayerInterface(),
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
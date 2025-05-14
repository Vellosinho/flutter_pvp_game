import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import '../game/game_sprite_sheet.dart';
import 'faction_selection_screen.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  void initState() {
    setFullscreen();
    super.initState();
  }

  void setFullscreen() async {
    await WindowManager.instance.setFullScreen(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Center(child: InterfaceSpriteSheet.titleScreen),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("GBB - Title",
                    style: TextStyle(fontFamily: "PressStart2P")),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Game()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FactionScreen()));
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(fontFamily: "PressStart2P", fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

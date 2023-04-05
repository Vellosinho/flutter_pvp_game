import 'package:flutter/material.dart';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';

  const PlayerInterface({Key? key}) : super(key: key);

  @override
  State<PlayerInterface> createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  @override
  Widget build(BuildContext context) {
    return const PlayerLife();
  }
}

class PlayerLife extends StatelessWidget {
  const PlayerLife({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0, left: 24),
            child: Image(image: AssetImage('assets/images/interface.png'), height: 192,),
          ),
        ],
      ),
    );
  }}
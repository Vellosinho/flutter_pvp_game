import 'package:bonfire/util/talk/say.dart';

class NpcDialogue {
  Say npcLines;
  List<String> answers;
  int correctAnswer;

  NpcDialogue({required this.npcLines, required this.answers, required this.correctAnswer});
}
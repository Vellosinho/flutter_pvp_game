
import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
import 'package:projeto_gbb_demo/game/structs/npc_structure.dart';

class NPCController with ChangeNotifier {

  List<NpcStructure> npcs = [
    NpcStructure( 
      affinity: 0, 
      index: 0,
      spawningHour: 630,
      spawningLocation: Vector2(1501, 2770),
      dialogue: [
        [NpcDialogue(
          npcLines: Say(text: [const TextSpan(text: 'Estou cansada de comer morangos, queria que essa fazenda fosse minha para plantar o que eu quiser')],),
          answers:['Porque voce nao compra uma?', 'Porque esta me dizendo isso?', 'Talvez um dia voce possa...'], correctAnswer: 2),],
        [NpcDialogue(
          npcLines: Say(text: [const TextSpan(text: 'Eu sou muito grata ao dono dessas terras, ele me da abrigo, comida... O que seria de mim sem ele?')],),
          answers: ['Voce seria desempregada', 'Voce seria livre', 'Voce passaria fome'], correctAnswer: 1),],
        [NpcDialogue(
          npcLines: Say(text: [const TextSpan(text: 'Acho que as coisas sao meio injustas. Porque o dono dessas terras nao trabalha aqui? Porque sobra tudo pra mim?')],),
          answers: ['Com certeza ele sente falta daqui', 'Porque ele tem outras coisas a fazer', 'Talvez essas terras nao devessem mais ser dele'], correctAnswer: 2),],
        [NpcDialogue(
          npcLines: Say(text: [const TextSpan(text: 'Eu tenho medo dos guardas reais, eles ficam muito violentos quando fazemos perguntas demais...')],),
          answers: ['Talvez voce devesse devolver na mesma moeda', 'Perguntas demais sao um problema pra todos nos', 'Entao eh so nao perguntarmos nada'], correctAnswer: 0),],
        [NpcDialogue(
          npcLines: Say(text: [const TextSpan(text: 'Eu gosto de voce, voce sempre sabe o que dizer. Voce sempre me mostra como o mundo eh injusto')],),
          answers: ['Eu ando sozinha', 'Talvez seja perigoso demais que continue conversando comigo', 'Entao porque nao luta ao meu lado?'], correctAnswer: 2),],
      ]
    )
  ];

  // void addNpc() {
  //   npcs.add(NpcStructure(affinity: 0, dialog: [], answers: []));
  // }

  void addAfinity(int index) {
    npcs[index].affinity++;
    notifyListeners();
  }

  List<NpcStructure> getSpawningNpcs(int currentHour) {
    List<NpcStructure> returnNpcs = [];
    for (int i = 0; i < npcs.length; i++) {
      if (npcs[i].spawningHour == currentHour && !npcs[i].isInGame) {
        npcs[i].isInGame = true;
        returnNpcs.add(npcs[i]);
      }
    }
    
    return returnNpcs;
  }
}
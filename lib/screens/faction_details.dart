import 'package:bonfire/util/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto_gbb_demo/game/character_faction.dart';
import 'package:provider/provider.dart';

import '../game/game_sprite_sheet.dart';
import '../players/player_consts.dart';
import '../starter.dart';

class FactionDetails extends StatefulWidget {
  const FactionDetails({super.key});

  @override
  State<FactionDetails> createState() => _FactionDetailsState();
}

class _FactionDetailsState extends State<FactionDetails> {
  late List<dynamic> descriptions = [];

  @override
  void initState() {
    descriptions = getDetails(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CharacterFaction faccaoSelecionada = context.read<PlayerConsts>().faccao;
    return Scaffold(body: Center(
      child: Stack(
        children: [
          Center(child: InterfaceSpriteSheet.titleScreen),
          Center(child: InterfaceSpriteSheet.menuScreenDescription),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: descriptions[0],
                ),
                const SizedBox(width: 80),
                SizedBox(
                  height: 370,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(descriptions[1], style: const TextStyle(fontFamily: "PressStart2P", fontSize: 28),),
                      const SizedBox(height: 16),
                      SizedBox(width: 480, child: Text(descriptions[2], style: const TextStyle(fontFamily: "PressStart2P", fontSize: 18), textAlign: TextAlign.justify,)),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          (faccaoSelecionada == CharacterFaction.Monarchist) ?
                            Navigator.pop(context) :
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Starter()));
                        },
                        child: Text((faccaoSelecionada == CharacterFaction.Monarchist) ? "Back" : "Start", style: TextStyle(fontFamily: "PressStart2P", fontSize: 18))
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: const [Text("Faction Details", style: TextStyle(fontFamily: "PressStart2P", fontSize: 36),)],),
          )
        ],
      ),
    ));
  }
}

class GameButton extends StatelessWidget {
  final Widget image;
  final Function onTap;
  const GameButton({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: MouseRegion(
        child: GestureDetector(
          onTap: () {
            onTap();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Starter()));
          },
          child: image,
        ),
      ),
    );
  }
}

String workersDescription = "Forged amidst the crowds, the workers movement grows daily, with demands of bigger salaries and better work conditions. Use your understanding of the working class problems to recruit other workers and assemble an army, Use your line of work to forge weapons and help your comrades march on the palace. Will you be able to lead this organic movement?";
String ownersDescription = "Your family has kept these lands for years and no filthy peasent is taking them away, your passive money income may be a valuable tool. Use your money and influence to contract an army of mercenaries or use your wealth to buy the best gear one could ever dream of having and show these people how to seize power. Will you be able to keep your properties during this turmoil?";
// String loyalistDescription = "Disatisfaction with the royalty grows significantly, and you see something as stable as your dinasty crumble before your very eyes. Use your charisma to keep your loyal forces and keep your fortress standing after the advances from the workers and the owners. Will you be able to keep your dinasty's legacy?";
String loyalistDescription = "Eu imaginei que escolheria o roxo. Infelizmente ainda nao terminei todas as animacoes desse, entao ele esta desabilitado... Testa com o vermelho ;3; Amo voce, Leticia... Mais do que tudo no mundo. voce eh tudo pra mim, e estar com voce eh tudo que eu sempre quis. Muito obrigado por ser a melhor namorada do mundo e por favor fique comigo pra sempre ;3;";

List<dynamic> getDetails(BuildContext context) {
  CharacterFaction faccaoSelecionada = context.read<PlayerConsts>().faccao;

  switch (faccaoSelecionada) {
    case CharacterFaction.Communist:
      return [InterfaceSpriteSheet.workersBanner, "Workers", workersDescription];
    case CharacterFaction.Capitalist:
      return [InterfaceSpriteSheet.ownersBanner, "Owners", ownersDescription];
    case CharacterFaction.Monarchist:
      return [Stack(children: [InterfaceSpriteSheet.loyalistsBanner, Positioned(bottom: 16, left: -16, child: InterfaceSpriteSheet.lindEasterEgg)]), "Querida Lind...", loyalistDescription];
    default:
      return [InterfaceSpriteSheet.workersBanner, "Workers", workersDescription];
  }
}
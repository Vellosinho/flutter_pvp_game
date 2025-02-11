import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_gbb_demo/game/controller/npc_controller.dart';
import 'package:projeto_gbb_demo/game/npcs/npcFunctionalities/npc_dialogue.dart';
import 'package:provider/provider.dart';

class NPCDialog extends StatefulWidget {
  const NPCDialog({
    Key? key,
    required this.dialogue,
    this.selectedAnswer = -1,
    this.onFinish,
    this.onChangeTalk,
    this.textBoxMinHeight = 100,
    this.keyboardKeysToNext = const [],
    this.padding,
    this.onClose,
    this.dismissible = false,
    this.talkAlignment = Alignment.bottomCenter,
    this.style,
    this.speed = 50, 
    this.npcIndex = -1,
  }) : super(key: key);

  static show(
    BuildContext context,
    int npcIndex,
    List<NpcDialogue> dialogue, {
    VoidCallback? onFinish,
    VoidCallback? onClose,
    ValueChanged<int>? onChangeTalk,
    Color? backgroundColor,
    double boxTextHeight = 100,
    List<LogicalKeyboardKey> logicalKeyboardKeysToNext = const [],
    EdgeInsetsGeometry? padding,
    bool dismissible = false,
    Alignment talkAlignment = Alignment.bottomCenter,
    TextStyle? style,
    int speed = 0,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      barrierColor: backgroundColor,
      context: context,
      builder: (BuildContext context) {
        return NPCDialog(
          npcIndex: npcIndex,
          dialogue: dialogue,
          onFinish: onFinish,
          onClose: onClose,
          onChangeTalk: onChangeTalk,
          textBoxMinHeight: boxTextHeight,
          keyboardKeysToNext: logicalKeyboardKeysToNext,
          padding: padding,
          dismissible: dismissible,
          talkAlignment: talkAlignment,
          style: style,
          speed: speed,
        );
      },
    );
  }

  final int npcIndex;
  final int selectedAnswer;
  final List<NpcDialogue> dialogue;
  final VoidCallback? onFinish;
  final VoidCallback? onClose;
  final ValueChanged<int>? onChangeTalk;
  final double? textBoxMinHeight;
  final List<LogicalKeyboardKey> keyboardKeysToNext;
  final EdgeInsetsGeometry? padding;
  final bool dismissible;
  final Alignment talkAlignment;
  final TextStyle? style;

  /// in milliseconds
  final int speed;

  @override
  NPCDialogState createState() => NPCDialogState();
}

class NPCDialogState extends State<NPCDialog> {
  final FocusNode _focusNode = FocusNode();
  late Say currentSay;
  int currentIndexTalk = 0;
  int currentSelectedAnswer = 0;
  bool finishedCurrentSay = false;

  final GlobalKey<TypeWriterState> _writerKey = GlobalKey();

  @override
  void initState() {
    currentSay = widget.dialogue[currentIndexTalk].npcLines;
    Future.delayed(Duration.zero, () {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.onClose?.call();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: KeyboardListener(
        focusNode: _focusNode,
        onKeyEvent: (raw) {
          if (widget.keyboardKeysToNext.isEmpty && raw is KeyDownEvent) {
            if (raw.logicalKey == LogicalKeyboardKey.arrowUp) {
              _hoverAnswerAbove();
            }
            if (raw.logicalKey == LogicalKeyboardKey.arrowDown) {
              _hoverAnswerBelow();
            }
            if (raw.logicalKey == LogicalKeyboardKey.keyZ) {
              _confirmAnswerSelection();
              _nextOrFinish();
            }
          } else if (widget.keyboardKeysToNext.contains(raw.logicalKey) && raw is KeyDownEvent) {
            _nextOrFinish();
          }
        },
        child: GestureDetector(
          onTap: _nextOrFinish,
          child: Container(
            color: Colors.transparent,
            padding: widget.padding ?? const EdgeInsets.all(10),
            child: Stack(
              alignment: widget.talkAlignment,
              children: [
                Align(
                  alignment: _getAlign(currentSay.personSayDirection),
                  child: currentSay.background ?? const SizedBox.shrink(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    ..._buildPerson(PersonSayDirection.LEFT),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          currentSay.header ?? const SizedBox.shrink(),
                          Container(
                            width: double.maxFinite,
                            padding:
                                currentSay.padding ?? const EdgeInsets.all(10),
                            margin: currentSay.margin,
                            constraints: widget.textBoxMinHeight != null
                                ? BoxConstraints(
                                    minHeight: widget.textBoxMinHeight!,
                                  )
                                : null,
                            decoration: currentSay.boxDecoration ??
                                BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TypeWriter(
                                    key: _writerKey,
                                    text: currentSay.text,
                                    speed: widget.speed,
                                    style: widget.style ??
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                    onFinish: () {
                                      finishedCurrentSay = true;
                                    },
                                  ),
                                ),
                                SizedBox(height: 8),
                                answers(widget.dialogue[currentIndexTalk].answers, currentSelectedAnswer),
                               
                              ],
                            ),
                          ),
                          currentSay.bottom ?? const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    ..._buildPerson(PersonSayDirection.RIGHT),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _hoverAnswerAbove() {
    if (currentSelectedAnswer > 0) {
      setState(() {
        currentSelectedAnswer--;
      });
    }
  }

  void _hoverAnswerBelow() {
    if (currentSelectedAnswer < (widget.dialogue[currentIndexTalk].answers.length) -1) {
      setState(() {
        currentSelectedAnswer++;
      });
    }
  }

  void _confirmAnswerSelection() {
    if (currentSelectedAnswer == widget.dialogue[currentIndexTalk].correctAnswer) {
      print('Correct Answer');
      context.read<NPCController>().addAfinity(widget.npcIndex);
    }
  }

  void _finishCurrentSay() {
    _writerKey.currentState?.finishTyping();
    finishedCurrentSay = true;
  }

  void _nextSay() {
    currentIndexTalk++;
    if (currentIndexTalk < widget.dialogue.length) {
      setState(() {
        finishedCurrentSay = false;
        currentSay = widget.dialogue[currentIndexTalk].npcLines;
      });
      _writerKey.currentState?.start(text: currentSay.text);
      widget.onChangeTalk?.call(currentIndexTalk);
    } else {
      widget.onFinish?.call();
      Navigator.pop(context);
    }
  }

  void _nextOrFinish() {
    if (finishedCurrentSay) {
      _nextSay();
    } else {
      _finishCurrentSay();
    }
  }

  List<Widget> _buildPerson(PersonSayDirection direction) {
    if (currentSay.personSayDirection == direction) {
      return [
        if (direction == PersonSayDirection.RIGHT && currentSay.person != null)
          SizedBox(
            width: (widget.padding ?? const EdgeInsets.all(10)).horizontal / 2,
          ),
        SizedBox(
          key: UniqueKey(),
          child: currentSay.person,
        ),
        if (direction == PersonSayDirection.LEFT && currentSay.person != null)
          SizedBox(
            width: (widget.padding ?? const EdgeInsets.all(10)).horizontal / 2,
          ),
      ];
    } else {
      return [];
    }
  }

  Alignment _getAlign(PersonSayDirection personDirection) {
    return personDirection == PersonSayDirection.LEFT
        ? Alignment.bottomLeft
        : Alignment.bottomRight;
  }

  Widget answers(List<String> dialogAnswers, int selectedAnswer) {
    return SizedBox(
      height: dialogAnswers.length *56, width: MediaQuery.of(context).size.width,
      child: ListView.builder(itemCount: dialogAnswers.length, itemBuilder: (BuildContext buildContext, int index) =>  SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border.all(color: selectedAnswer == index ? Colors.white : Colors.transparent)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  children: [Text(dialogAnswers[index], style: widget.style ??
                    const TextStyle(
                      color: Colors.white,
                    ),),]
                ),
            ),
          ),
        ),
      ),),
    );
  }
}
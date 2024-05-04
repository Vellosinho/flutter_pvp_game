import 'package:bonfire/base/bonfire_game_interface.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../players/class_objects.dart/smith_sword.dart';
import 'character_class.dart';
import 'dart:math';

class LocalGameController with ChangeNotifier {
  bool gameIsPaused = false;
  bool minigameIsActive = false;

  int _playerLife = 20;
  int _playerWallet = 0;
  int _playerFollowers = 0;
  int _hitCount = 0;
  List<ForgedSword> swords = [];

  int get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;


  //Mini Game logic:
  int swordScore = 0;
  int minigameHitCount = 0;
  double timeCount = 0.0;
  bool _playAnimation = false;
  bool get playAnimation => _playAnimation;


  void heal(int value) {
    ((_playerLife + value) > 20) ?
      _playerLife = 20 : _playerLife += value;
    notifyListeners();
  }

  void hit(int value) {
    ((_playerLife - value) < 1) ?
      _playerLife = 1 : _playerLife -= value;
    notifyListeners();
  }

  void getMoney(int amount) {
    _playerWallet += amount;
    notifyListeners();
  }

  void spendMoney(int amount) {
    (_playerWallet - amount < 0) ?
    _playerWallet = 0 : _playerWallet -= amount;
    notifyListeners();
  }

  void playerFollowersAdd() {
    _playerFollowers++;
    notifyListeners();
  }

  void addHitCount() {
    _hitCount++;
    Future.delayed(const Duration(seconds: 3), () {
      _hitCount--;
    });
  }

  void addArrowHitCount() {
    _hitCount--;
    Future.delayed(const Duration(seconds: 3), () {
      _hitCount++;
    });
  }

  void togglePaused() {
    gameIsPaused = !gameIsPaused;
    notifyListeners();
  }

  void startMinigame() {
    minigameHitCount = 0;
    swordScore = 0;
    minigameIsActive = true;
    startGameLoopCounter();
    notifyListeners();
  }

  void miniGameHit(BonfireGameInterface gameRef) {
    if (minigameHitCount < 4) {
      setSwordScore(sin(timeCount));
      minigameHitCount++;
      Future.delayed(const Duration(milliseconds: 250), () {
        gameRef.camera.animateZoom(zoom: 0.85 + (minigameHitCount * 0.05), duration : const Duration(milliseconds: 250), curve: Curves.easeInSine);
      });
    }
    else {
      setSwordScore(sin(timeCount));
      if(swordScore >= 170) {
        _playAnimation = true;
        swords.add(ForgedSword(swordScore: swordScore, isLegendary: (swordScore == 250)));
        print("added sword: score $swordScore");
      }
      Future.delayed(const Duration(milliseconds: 1000), () {
        gameRef.camera.animateZoom(zoom: 0.8, duration : const Duration(milliseconds: 250), curve: Curves.easeInSine);
      });
      minigameIsActive = false;
    }
    notifyListeners();
  }

  void turnOffAnimation() {
    _playAnimation = false;
    notifyListeners();
  }

  Future<void> startGameLoopCounter() async {
    timeCount = 0;
    while (minigameIsActive) {
      await Future.delayed(const Duration(milliseconds: 25), () { 
        timeCount = timeCount + 0.075; //Increment Counter
      });
      notifyListeners();
    }
  }

  void setSwordScore(double value) {
    if (value < 0) {
      value = value * -1;
    }

    if(value > 0.45) {
      swordScore += 10;
    } else if(value > 0.15) {
      swordScore += 25;
    } else {
      swordScore += 50;
    }
  }
}
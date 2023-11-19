import 'package:flutter/foundation.dart';
import 'character_class.dart';
import 'dart:math';

class LocalGameController with ChangeNotifier {
  bool gameIsPaused = false;
  bool minigameIsActive = false;

  int _playerLife = 20;
  int _playerWallet = 0;
  int _playerFollowers = 0;
  int _hitCount = 0;

  int get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;


  //Mini Game logic:
  int swordScore = 0;
  int minigameHitCount = 0;
  double timeCount = 0.0;


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

  void miniGameHit() {
    if (minigameHitCount < 4) {
      setSwordScore(sin(timeCount));
      minigameHitCount++;
      print(swordScore);
    }
    else {
      setSwordScore(sin(timeCount));
      print(swordScore);
      minigameIsActive = false;
    }
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
    (value < 0) ? (value * -1) : null;

    if(value > 0.4) {
      swordScore += 10;
    } else if(value > 0.15) {
      swordScore += 25;
    } else {
      swordScore += 50;
    }
  }
}
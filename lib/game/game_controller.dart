import 'package:flutter/foundation.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';
import 'package:projeto_gbb_demo/game/items/iron_item.dart';
import 'package:projeto_gbb_demo/game/items/sword_item.dart';
import 'enum/character_class.dart';
import 'dart:math';

class LocalGameController with ChangeNotifier {
  bool gameIsPaused = false;
  bool minigameIsActive = false;

  int _playerLife = 20;
  int _playerWallet = 0;
  int _playerFollowers = 0;
  int _hitCount = 0;
  final List<Item> _inventory = [
    Item(name: 'empty'),
    Item(name: 'empty'),
    Item(name: 'empty'),
    Item(name: 'empty'),
  ];
  List<Item> get inventory => _inventory;

  //remove later

  int get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;


  //Mini Game logic:
  int swordScore = 0;
  int minigameHitCount = 0;
  double timeCount = 0.0;
  OneTimeAnimations _playAnimation = OneTimeAnimations.none;
  OneTimeAnimations get playAnimation => _playAnimation;


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

  void getIron() {
    if (!isInventoryFull()) {
      addToInventory(IronBar());
      _playAnimation = OneTimeAnimations.acquiredIron;
    } else {
      shrugPlayer();
    }
    notifyListeners();
  }

  void startMinigame() {
    if(hasIron()) {
      removeFromInventory(IronBar());
      minigameHitCount = 0;
      swordScore = 0;
      minigameIsActive = true;
      startGameLoopCounter();
      notifyListeners();
    } else {
      shrugPlayer();
    }
  }

  void miniGameHit() {
    if (minigameHitCount < 4) {
      setSwordScore(sin(timeCount));
      minigameHitCount++;
    }
    else {
      setSwordScore(sin(timeCount));
      if(swordScore >= 170) {
        _playAnimation = (swordScore == 250) ? OneTimeAnimations.perfectSwordComplete : OneTimeAnimations.swordComplete;
        // swords.add(ForgedSword(swordScore: swordScore, isLegendary: (swordScore == 250)));
        addToInventory(Sword(isLegenday: swordScore >= 250));
        print("added sword: score $swordScore");
      }
      minigameIsActive = false;
    }
    notifyListeners();
  }

  void turnOffAnimation() {
    _playAnimation = OneTimeAnimations.none;
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

  void addToInventory(Item itemToAdd) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if(_inventory[0].name == 'empty') {
      _inventory[0] = itemToAdd;
    } else if(_inventory[1].name == 'empty') {
      _inventory[1] = itemToAdd;
    } else if(_inventory[2].name == 'empty') {
      _inventory[2] = itemToAdd;
    } else if(_inventory[3].name == 'empty') {
      _inventory[3] = itemToAdd;
    }
    notifyListeners();
  }

  void removeFromInventory(Item itemToRemove) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if(_inventory[0].name == itemToRemove.name) {
      _inventory[0] = Item(name: 'empty');
    } else if(_inventory[1].name == itemToRemove.name) {
      _inventory[1] = Item(name: 'empty');
    } else if(_inventory[2].name == itemToRemove.name) {
      _inventory[2] = Item(name: 'empty');
    } else if(_inventory[3].name == itemToRemove.name) {
      _inventory[3] = Item(name: 'empty');
    }
    notifyListeners();
  }

  bool hasIron() {
    bool _hasIron = false;
    for (int i = 0; i < 4; i++) {
      if(_inventory[i].name == 'ironBar') {
        _hasIron = true;
      }
    }
    return _hasIron;
  }

  bool isInventoryFull() {
    bool _full = true;
    for (int i = 0; i < 4; i++) {
      if(_inventory[i].name == 'empty') {
        _full = false;
      }
    }
    return _full;
  }

  Item? getFirstOfType(Item type) {
    int pos = -1;
    for(int i = 0; i < 4; i++) {
      if(_inventory[i].name == type.name) {
        pos = i;
      }
    }
    if(pos == -1) {
      return null;
    } 
      return _inventory[pos];
  }

  void shrugPlayer() {
    _playAnimation = OneTimeAnimations.shrug;
  }
}
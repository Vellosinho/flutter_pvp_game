import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto_gbb_demo/game/enum/enum_day_time.dart';
import 'package:projeto_gbb_demo/game/enum/one_time_animations.dart';
import 'package:projeto_gbb_demo/game/items/base_item.dart';
import 'package:projeto_gbb_demo/game/items/iron_item.dart';
import 'package:projeto_gbb_demo/game/items/sword_item.dart';
import 'dart:math';

class LocalGameController with ChangeNotifier {
  int hour = 06;
  // int hour = 6
  int minute = 00;

  DayTime daytime = DayTime.same;

  Color mapTintColor = Colors.orange[400]!.withAlpha(48);

  bool gameIsPaused = false;
  bool minigameIsActive = false;
  bool _resetColision = false;
  bool get resetColision => _resetColision;

  double _playerLife = 100;
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

  double get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;

  //Mini Game logic:
  int swordScore = 0;
  int minigameHitCount = 0;
  double timeCount = 0.0;
  Vector2 minigamePos = Vector2(0, 0);
  OneTimeAnimations _playAnimation = OneTimeAnimations.none;
  OneTimeAnimations get playAnimation => _playAnimation;

  int stashedIron = 0;

  void heal(int value) {
    ((_playerLife + value) > 20) ? _playerLife = 20 : _playerLife += value;
    notifyListeners();
  }

  void hit(double value) {
    _playerLife -= value;
    print("playerLife: $_playerLife");
    notifyListeners();
  }  
  
  void toggleResetCollision() {
    _resetColision = !_resetColision;
    notifyListeners();
  }

  void getMoney(int amount) {
    _playerWallet += amount;
    notifyListeners();
  }

  void spendMoney(int amount) {
    (_playerWallet - amount < 0) ? _playerWallet = 0 : _playerWallet -= amount;
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

  bool getIron(ironCount) {
    if (!isInventoryFull() && (ironCount > 0)) {
      addToInventory(IronBar());
      stashedIron--;
      _playAnimation = OneTimeAnimations.acquiredIron;
      notifyListeners();
      return true;
    } else {
      shrugPlayer();
      notifyListeners();
      return false;
    }
  }

  // Smithing Table functions:

  void getWeapon() {
    _playAnimation = OneTimeAnimations.acquiredHammer;
    notifyListeners();
  }

  // Anvil functions:

  void startMinigame(Vector2 pos, double damage) {
    if (hasIron() && damage >= 15) {
      removeFromInventory(IronBar());
      minigameHitCount = 0;
      swordScore = 0;
      minigameIsActive = true;
      minigamePos = pos;
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
    } else {
      setSwordScore(sin(timeCount));
      if (swordScore >= 170) {
        _playAnimation = (swordScore == 250)
            ? OneTimeAnimations.perfectSwordComplete
            : OneTimeAnimations.swordComplete;
        // swords.add(ForgedSword(swordScore: swordScore, isLegendary: (swordScore == 250)));
        addToInventory(Sword(isLegenday: swordScore >= 250));
      }
      minigameIsActive = false;
    }
    notifyListeners();
  }

  void checkMinigameDistance(Vector2 currentPosition) {
    if (minigameIsActive) {
      if (((currentPosition.x - minigamePos.x > 320) ||
              (currentPosition.x - minigamePos.x < -320)) ||
          ((currentPosition.y - minigamePos.y > 320) ||
              (currentPosition.y - minigamePos.y < -320))) {
        cancelMinigame();
        notifyListeners();
      }
    }
  }

  void cancelMinigame() {
    minigameIsActive = false;
    notifyListeners;
  }

  void turnOffAnimation() {
    _playAnimation = OneTimeAnimations.none;
    notifyListeners();
  }

  Future<void> startGameLoopCounter() async {
    Random rand = Random();
    double randVelocity = (rand.nextInt(75) + 50) / 1000;
    timeCount = 0;
    while (minigameIsActive) {
      await Future.delayed(const Duration(milliseconds: 25), () {
        timeCount = timeCount + randVelocity; //Increment Counter
      });
      notifyListeners();
    }
  }

  void setSwordScore(double value) {
    if (value < 0) {
      value = value * -1;
    }

    if (value > 0.45) {
      swordScore += 10;
    } else if (value > 0.15) {
      swordScore += 25;
    } else {
      swordScore += 50;
    }
  }

  int getTime() {
    int time = (hour * 100) + minute;
    return time;
  }

  // Inventory Functions:

  void addToInventory(Item itemToAdd) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if (_inventory[0].name == 'empty') {
      _inventory[0] = itemToAdd;
    } else if (_inventory[1].name == 'empty') {
      _inventory[1] = itemToAdd;
    } else if (_inventory[2].name == 'empty') {
      _inventory[2] = itemToAdd;
    } else if (_inventory[3].name == 'empty') {
      _inventory[3] = itemToAdd;
    }
    notifyListeners();
  }

  void removeFromInventory(Item itemToRemove) {
    // _inventory.firstWhere((element) => element.name == 'empty');
    if (_inventory[0].name == itemToRemove.name) {
      _inventory[0] = Item(name: 'empty');
    } else if (_inventory[1].name == itemToRemove.name) {
      _inventory[1] = Item(name: 'empty');
    } else if (_inventory[2].name == itemToRemove.name) {
      _inventory[2] = Item(name: 'empty');
    } else if (_inventory[3].name == itemToRemove.name) {
      _inventory[3] = Item(name: 'empty');
    }
    notifyListeners();
  }

  bool hasIron() {
    bool hasIron = false;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == 'ironBar') {
        hasIron = true;
      }
    }
    return hasIron;
  }

  bool isInventoryFull() {
    bool full = true;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == 'empty') {
        full = false;
      }
    }
    return full;
  }

  Item? getFirstOfType(Item type) {
    int pos = -1;
    for (int i = 0; i < 4; i++) {
      if (_inventory[i].name == type.name) {
        pos = i;
        break;
      }
    }
    if (pos == -1) {
      return null;
    }
    return _inventory[pos];
  }

  void startDaynightCycle() {
    Future.delayed(Duration(seconds: 10), () {
      passMinute();
    });
  }

  void passMinute() {
    print("$hour:$minute");
    if (minute > 40) {
      passHour();
      minute = 00;
    } else {
      minute += 10;
    }

    updateShading();

    // Future.delayed(Duration(seconds: 10), () {
    Future.delayed(Duration(seconds: 10), () {
      passMinute();
    });
  }

  void passHour() {
    if (hour > 22) {
      hour = 00;
    } else {
      hour++;
    }
    updateShading();
  }

  void updateShading() {
    Color nightColor = Colors.indigo[900]!.withAlpha(148);
    Color sunRiseColor = Colors.orange[400]!.withAlpha(48);
    Color noonColor = Colors.orange[400]!.withAlpha(0);

    switch (hour) {
      case 6:
        mapTintColor = sunRiseColor;
        daytime = DayTime.sunrise;
        break;
      case 7:
        mapTintColor = noonColor;
        daytime = DayTime.noon;
        break;
      case 18:
        mapTintColor = sunRiseColor;
        daytime = DayTime.sunset;
        break;
      case 19:
        mapTintColor = nightColor;
        daytime = DayTime.night;
        break;
    }
    notifyListeners();
  }

  void turnOffTimechange() {
    daytime = DayTime.same;
    notifyListeners();
  }

  void shrugPlayer() {
    _playAnimation = OneTimeAnimations.shrug;
  }
}

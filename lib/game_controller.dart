import 'package:flutter/foundation.dart';

class LocalGameController with ChangeNotifier {
  int _playerLife = 20;
  int _playerWallet = 0;
  int _playerFollowers = 0;
  int _hitCount = 0;

  int get playerLife => _playerLife;
  int get playerWallet => _playerWallet;
  int get playerFollowers => _playerFollowers;
  int get hitcount => _hitCount;

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
}
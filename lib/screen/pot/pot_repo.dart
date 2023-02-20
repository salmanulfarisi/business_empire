import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotRepo {
  static ValueNotifier<double> potMoney = ValueNotifier(0.0);

  setPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('potMoney', potMoney.value);
  }

  getPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PotRepo.potMoney.value = prefs.getDouble('potMoney') ?? 0.0;
  }

  static void increamentPotMoney(double value) {
    potMoney.value += value;
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoldRepo {
  static ValueNotifier<double> gold = ValueNotifier(0.0);
  static ValueNotifier<double> totalGold = ValueNotifier(0.0);

  static void increamentGold(double value) {
    gold.value += value;
    totalGold.value += value;
  }

  setGold() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('gold', totalGold.value);
  }

  getGold() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    GoldRepo.totalGold.value = prefs.getDouble('gold') ?? 0.0;
  }
}

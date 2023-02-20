import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarningsRepo {
  static ValueNotifier<double> earnings = ValueNotifier(0);

  static void increamentEarnings(double value) {
    earnings.value = earnings.value + value;
  }

  static void decreamentEarnings(double value) {
    earnings.value = earnings.value - value;
    if (earnings.value < 0) {
      earnings.value = 0;
    }
  }

  setEarnings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('earnings', earnings.value);
  }
}

class PostNameRepo {
  static ValueNotifier<String> postName = ValueNotifier('Pot Name');
  static ValueNotifier<List<String>> postNameList = ValueNotifier([
    "post Name 1",
    "post Name 2",
    "post Name 3",
  ]);
  static List<double> interestList = [
    2.25,
    3.25,
    4.25,
  ];
  static List subtitleList = [
    "Set aside money for your daily expenses",
    "Grow your money effortlessly for your short-term goals",
    "Save for your long-term goals",
  ];
}

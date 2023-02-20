import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarningsRepo {
  static ValueNotifier<double> earnings = ValueNotifier(0);
  static ValueNotifier<double> expanses = ValueNotifier(0);
  static ValueNotifier<int> clicks = ValueNotifier(0);
  static ValueNotifier<double> totalPotMoney = ValueNotifier(0);

  // static const String username = 'Salman';
  // String upiId = '${username}123456@upi';

  // setUpiId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('upiId', upiId);
  // }

  // getUpiId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   upiId = prefs.getString('upiId') ?? '${username}12345@upi';
  // }
  static void increamentClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    clicks.value = clicks.value + 1;
    prefs.setInt('clicks', clicks.value);
  }

  static void getTotalClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    clicks.value = prefs.getInt('clicks') ?? 0;
  }

  static void increamentEarnings(double value) {
    earnings.value = earnings.value + value;
  }

  static void increamentExpanses(double value) {
    expanses.value = expanses.value + value;
  }

  setExp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('expanses', expanses.value);
  }

  getExp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    expanses.value = prefs.getDouble('expanses') ?? 0;
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

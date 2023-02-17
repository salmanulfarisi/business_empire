import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarningsRepo {
  static ValueNotifier<int> earnings = ValueNotifier(0);

  static void increamentEarnings(int value) {
    earnings.value = earnings.value + value;
  }

  setEarnings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('earnings', earnings.value);
  }
}

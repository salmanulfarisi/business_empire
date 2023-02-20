import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BankRepo {
  static ValueNotifier<double> bankAmount = ValueNotifier(0.00);

  static void addAmount(double amount) {
    bankAmount.value = bankAmount.value + amount;
  }

  setBankAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('bankAmount', bankAmount.value);
  }

  getBankAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bankAmount.value = prefs.getDouble('bankAmount') ?? 0.00;
  }
}

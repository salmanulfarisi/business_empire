import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  static ValueNotifier<String> userName = ValueNotifier('salman');
  static ValueNotifier<String> email =
      ValueNotifier('${userName.value}@gmail.com');
  static ValueNotifier<String> upiId =
      ValueNotifier("${userName.value}123456@upi");

  static ValueNotifier<String> cardNumber = ValueNotifier('');

  static void setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = value;
    email.value = value + '@gmail.com';
    upiId.value = value + '123456@upi';
    prefs.setString('userName', userName.value);
  }

  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? 'Salman';
  }

  setcardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cardNumber', cardNumber.value);
  }

  getCardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cardNumber.value = prefs.getString('cardNumber') ?? '';
  }

  generateAccnum() {
    String accNum = '';
    for (int i = 0; i < 16; i++) {
      accNum += (i % 4 == 0 && i != 0) ? ' ' : '${Random().nextInt(10)}';
    }
    cardNumber.value = accNum;
    return cardNumber.value;
  }
}

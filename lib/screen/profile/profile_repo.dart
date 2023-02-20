import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  static ValueNotifier<String> userName = ValueNotifier('salman');
  static ValueNotifier<String> email =
      ValueNotifier('${userName.value}@gmail.com');
  static ValueNotifier<String> upiId =
      ValueNotifier("${userName.value}123456@upi");

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
}

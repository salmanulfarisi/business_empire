import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';

Widget appLogoWidget() {
  return Image.asset(
    icAppLogo,
  ).box.rounded.white.size(77, 77).padding(const EdgeInsets.all(10)).make();
}

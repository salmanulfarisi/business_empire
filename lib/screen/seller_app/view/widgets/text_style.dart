import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';

Widget normalText({text, color = whiteColor, size = 14.0}) {
  return "$text".text.color(color).size(size).make();
}

Widget boldText({text, color = whiteColor, size = 14.0}) {
  return '$text'.text.semiBold.color(color).size(size).make();
}

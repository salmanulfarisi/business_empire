import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    onPressed: () {
      onPress();
    },
    child: title!.text.color(textColor).fontFamily(bold).make(),
    style: ElevatedButton.styleFrom(
      foregroundColor: textColor,
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

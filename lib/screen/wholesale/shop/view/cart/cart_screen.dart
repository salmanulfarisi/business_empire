import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Container(
          child: "Cart is Empty!"
              .text
              .fontFamily(semibold)
              .color(textfieldGrey)
              .makeCentered()),
    );
  }
}

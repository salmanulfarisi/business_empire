import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: "Cart is Empty!"
            .text
            .fontFamily(semibold)
            .color(whiteColor)
            .makeCentered());
  }
}

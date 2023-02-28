import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';

Widget sellerOrderPlaced({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: '$title1', color: fontGrey),
            boldText(text: '$d1', color: redColor)
            // '$title1'.text.fontFamily(semibold).make(),
            // "$d1".text.color(redColor).fontFamily(semibold).make(),
          ],
        ),
        SizedBox(
          width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: '$title2', color: fontGrey),
              boldText(text: '$d2', color: redColor)
              // '$title2'.text.fontFamily(semibold).make(),
              // "$d2".text.color(redColor).fontFamily(semibold).make(),
            ],
          ),
        )
      ],
    ),
  );
}

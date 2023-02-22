import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class MyBussinessess extends StatelessWidget {
  final Size size;
  final String shopImage;
  final String shopName;
  final String shopType;
  const MyBussinessess({
    Key? key,
    required this.size,
    required this.shopImage,
    required this.shopName,
    required this.shopType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.2,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.orange[800],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(shopImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: size.height * 0.2,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: size.height * 0.05,
          left: size.width * 0.05,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shopName,
                style: AppStyle.title2.copyWith(color: Colors.white),
              ),
              Text(
                shopType,
                style: AppStyle.subtitle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

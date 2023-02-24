import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Size size;
  final String text;
  final double? width;
  final double? height;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    required this.size,
    required this.text,
    this.onTap,
    this.width = 0.40,
    this.height = 0.05,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * width!,
        height: size.height * height!,
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyle.title,
          ),
        ),
      ),
    );
  }
}

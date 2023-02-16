import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Size size;
  final String text;
  final Function()? onTap;
  const ButtonWidget(
      {Key? key, required this.size, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width * 0.40,
        height: size.height * 0.05,
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.orange[800],
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

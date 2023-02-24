import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Size size;
  final String text;
  final IconData icon;
  final Function()? onTap;

  const RoundButton(
      {Key? key,
      required this.size,
      required this.text,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: darkFontGrey.withOpacity(0.1),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: Colors.orange[800],
                size: 30,
              ),
            ),
          ),
        ),
        AppSize().height10,
        Text(
          text,
          style: AppStyle.category,
        ),
      ],
    );
  }
}

class NonVisibleRoundButoon extends StatelessWidget {
  final Size size;
  final String text;
  final IconData icon;
  final Function()? onTap;
  const NonVisibleRoundButoon({
    Key? key,
    required this.size,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: lightGrey,
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: Colors.grey[800],
                size: 30,
              ),
            ),
          ),
        ),
        AppSize().height10,
        Text(
          text,
          style: AppStyle.category,
        ),
      ],
    );
  }
}

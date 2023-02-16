import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class EarningContainer extends StatelessWidget {
  final Size size;
  final Function()? onTap;
  const EarningContainer({Key? key, required this.size, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.5),
      hoverColor: Colors.grey.withOpacity(0.5),
      splashColor: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.3,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const Icon(
              Icons.touch_app_rounded,
              size: 80,
            ),
            AppSize().height20,
            const Text(
              'Touch to start earnings',
              style: AppStyle.title2,
            ),
          ],
        ),
      ),
    );
  }
}

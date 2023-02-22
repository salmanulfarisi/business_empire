import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class GetStartedWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  const GetStartedWidget(
      {Key? key, required this.text, required this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            AppSize().width10,
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class IconsTextRow extends StatelessWidget {
  final String text;
  final String subtitle;
  final IconData icon;
  const IconsTextRow({
    Key? key,
    required this.text,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        AppSize().width10,
        SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

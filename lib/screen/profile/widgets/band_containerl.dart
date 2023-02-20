import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class BankCondainer extends StatelessWidget {
  final Function() onTap;
  const BankCondainer({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.black,
      strokeWidth: 1,
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      child: InkWell(
        focusColor: Colors.grey[300],
        highlightColor: Colors.grey[300],
        splashColor: Colors.grey[300],
        hoverColor: Colors.grey[300],
        onTap: () {
          onTap();
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.add_card,
                size: 50,
              ),
              Text('Add Bank Account'),
            ],
          ),
        ),
      ),
    );
  }
}

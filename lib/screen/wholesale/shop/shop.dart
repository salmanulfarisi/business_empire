import 'package:flutter/material.dart';

class ShopOne extends StatelessWidget {
  final String title;
  const ShopOne({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}

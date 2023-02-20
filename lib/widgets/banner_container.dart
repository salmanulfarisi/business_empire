import 'package:business_empire/utils/utils.dart';
import 'package:flutter/material.dart';

class BannerContainer extends StatelessWidget {
  final double amount;
  final double getGm;
  final double currentPrice;
  const BannerContainer({
    Key? key,
    required this.amount,
    required this.getGm,
    this.currentPrice = 5813.00,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current price  - \u{20B9}$currentPrice/gm and you\'ll get  - $getGm/gm',
            style: AppStyle.bodyGrey,
          ),
        ],
      ),
    );
  }
}

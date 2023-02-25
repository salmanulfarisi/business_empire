import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeContainer extends StatelessWidget {
  final Size size;

  final String upiId;
  final Function()? onTap;
  const HomeContainer(
      {Key? key, required this.size, this.onTap, required this.upiId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.3,
      padding: EdgeInsets.all(size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          'Total Earnings'.text.color(darkFontGrey).size(16).make(),
          10.heightBox,
          ValueListenableBuilder(
              valueListenable: EarningsRepo.earnings,
              builder: (context, value, child) {
                return '₹ $value'
                    .text
                    .color(darkFontGrey)
                    .size(24)
                    .fontFamily(semibold)
                    .make();
              }),
          AppSize().height10,
          Container(
            width: size.width * 0.55,
            height: size.height * 0.039,
            padding: EdgeInsets.all(size.width * 0.02),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: const [
                Icon(Icons.currency_rupee_rounded),
                Text(
                  'Check Your Bank Balance',
                  style: AppStyle.body,
                ),
              ],
            ),
          ),
          AppSize().height10,
          ButtonWidget(
            size: size,
            text: 'Check Bank',
            onTap: onTap,
          ),
          AppSize().height20,
          SizedBox(
            width: size.width * 1.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Upi ID: $upiId",
                  style: AppStyle.bodyGrey,
                ),
                AppSize().width10,
                GestureDetector(
                  onTap: () {
                    if (upiId == "Add Your Name") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Add Your Name First"),
                        ),
                      );
                    } else {
                      Clipboard.setData(
                        ClipboardData(text: upiId),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('UPI ID Copied'),
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.copy,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

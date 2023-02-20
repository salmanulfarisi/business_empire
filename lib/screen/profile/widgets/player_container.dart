import 'package:business_empire/screen/gold/gold_repo.dart';
import 'package:business_empire/screen/pot/pot_repo.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/style.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlayerContainer extends StatelessWidget {
  const PlayerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String UpiId = 'salman123456@upi';
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              AppSize().width20,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Name: ',
                        style: AppStyle.body,
                      ),
                      Text(
                        'Salman',
                        style: AppStyle.body,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'E-mail: ',
                        style: AppStyle.body,
                      ),
                      Text(
                        'salman@gmail.cm',
                        style: AppStyle.body,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Upi Id: ',
                        style: AppStyle.body,
                      ),
                      Text(
                        UpiId,
                        style: AppStyle.body,
                      ),
                      AppSize().width10,
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: UpiId));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('UPI ID Copied'),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.copy,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppSize().width10,
          const Divider(
            color: Colors.grey,
          ),
          AppSize().width10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.4,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Total Earnings',
                      style: AppStyle.title2,
                    ),
                    Text(
                      "₹${EarningsRepo.earnings.value}",
                      style: AppStyle.subtitleBlack,
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.4,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Total Expenses',
                      style: AppStyle.title2,
                    ),
                    ValueListenableBuilder(
                        valueListenable: EarningsRepo.expanses,
                        builder: (context, double value, child) {
                          return Text(
                            "₹$value",
                            style: AppStyle.subtitleBlack,
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              const Text(
                'Total Clicks : ',
                style: AppStyle.subtitleBlack,
              ),
              Text(
                "${EarningsRepo.clicks.value}",
                style: AppStyle.subtitleBlack,
              ),
            ],
          ),
          AppSize().height10,
          Row(
            children: [
              const Text(
                'Cash in Pot : ',
                style: AppStyle.subtitleBlack,
              ),
              ValueListenableBuilder(
                  valueListenable: PotRepo.potMoney,
                  builder: (context, double value, child) {
                    return Text(
                      "₹ " + value.toStringAsFixed(2),
                      style: AppStyle.subtitleBlack,
                    );
                  }),
            ],
          ),
          AppSize().height10,
          Row(
            children: [
              const Text(
                'Total Gold : ',
                style: AppStyle.subtitleBlack,
              ),
              ValueListenableBuilder(
                  valueListenable: GoldRepo.totalGold,
                  builder: (context, double value, child) {
                    return Text(
                      value.toStringAsFixed(4) + "g",
                      style: AppStyle.subtitleBlack,
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

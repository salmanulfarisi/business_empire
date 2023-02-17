import 'package:business_empire/screen/pot/widget/pot_container.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/pot_ad_container.dart';
import 'package:flutter/material.dart';

class PotPage extends StatelessWidget {
  final Size size;

  const PotPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        centerTitle: true,
        title: Column(
          children: const [
            Text('Save in Pot'),
            Text(
              'Total Savings in Pot = \u{20B9}0',
              style: AppStyle.body,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PotAdContainer(
              size: size,
            ),
            AppSize().height20,
            const Text(
              'Your Pot',
              style: AppStyle.title2,
            ),
            AppSize().height20,
            SizedBox(
              height: size.height * 0.4,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PotContainer(
                    size: size,
                  );
                },
                separatorBuilder: (context, index) {
                  return AppSize().width20;
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:business_empire/screen/pot/widget/icon_text_row.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class PotMore extends StatelessWidget {
  final Size size;
  const PotMore({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://life.futuregenerali.in/media/fyvhebzt/how-to-save-money-from-your-monthly-salary.webp"),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Make Savings a Habit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
                AppSize().height20,
                AppSize().height20,
                const IconsTextRow(
                  icon: LineIcons.piggyBank,
                  text: 'Save daily, weekly or monthly',
                  subtitle: 'Add a Habit to save regularly',
                ),
                AppSize().height20,
                const IconsTextRow(
                  icon: LineIcons.phone,
                  text: 'Never forget to save',
                  subtitle: 'Start a Hibit, put your Savings on autopilot',
                ),
                AppSize().height20,
                const IconsTextRow(
                  icon: LineIcons.userShield,
                  text: 'No penalty Habits',
                  subtitle: 'Skip automatically when balance is low',
                ),
                AppSize().height50,
                ButtonWidget(
                  width: size.width,
                  size: size,
                  text: "Start a Habit",
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

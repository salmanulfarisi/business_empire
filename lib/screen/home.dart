import 'dart:developer';

import 'package:business_empire/screen/gold.dart';
import 'package:business_empire/screen/pot/pot.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/dialogue_box.dart';
import 'package:business_empire/widgets/earning_container.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String username = 'Salman';
  String greeting = 'Good Morning';
  String upiId = '${username}123456';
  bool isVisble = false;
  ValueNotifier earnings = EarningsRepo.earnings;
  // inifite = inifinite value to variable

  var infinite = double.infinity;

  _infinitecounter() async {
    for (var i = 0; i < infinite; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          earnings.value++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor1000() async {
    EarningsRepo.earnings.value = EarningsRepo.earnings.value - 500;
    for (var i = 0; i < 1000; i++) {
      //Loop 100 times
      print(i);
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          earnings.value++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor2000() async {
    earnings.value = earnings.value - 600;
    for (var i = 0; i < 2000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          earnings.value++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor3000() async {
    earnings.value = earnings.value - 800;
    for (var i = 0; i < 3000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          earnings.value++; //Increment earnings.value
        });
      });
    }
  }

  _incrementCounter() {
    setState(() {
      EarningsRepo.increamentEarnings(1);
      EarningsRepo().setEarnings();
    });

    if (earnings.value == 10) {
      showDialog(
          context: context,
          builder: (context) {
            return infoDialogeBox(
              context,
              'Congratulation',
              'You can now earn by auto click. Click on auto button to start earning',
              Colors.green,
              'Ok',
            );
          });
    }
  }

  bool visibleRoundButton() {
    if (earnings.value > 10) {
      setState(() {
        isVisble = true;
      });
    } else {
      setState(() {
        isVisble = false;
      });
    }
    return isVisble;
  }

  getEarnings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    EarningsRepo.earnings.value = prefs.getInt('earnings') ?? 0;
    log(prefs.getInt('earnings').toString());
  }

  @override
  void initState() {
    getEarnings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.35,
                color: const Color.fromARGB(255, 255, 87, 16),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.menu),
                  AppSize().width20,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello,$username',
                        style: AppStyle.title,
                      ),
                      Text(
                        AppFunctions.greetings(greeting),
                        style: AppStyle.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.05,
            child: HomeContainer(
              size: size,
              onTap: _incrementCounter,
              upiId: upiId,
            ),
          ),
          Positioned(
            top: size.height * 0.48,
            left: size.width * 0.1,
            child: Row(
              children: [
                visibleRoundButton()
                    ? RoundButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return autoClickDialog(
                                  context,
                                  'Auto Click',
                                  'Click on auto button to start earning',
                                  Colors.green,
                                  'Ok',
                                  earnings.value,
                                  _increamentCounterFor1000,
                                  _increamentCounterFor2000,
                                  _increamentCounterFor3000,
                                );
                              });
                        },
                        text: 'auto',
                        icon: Icons.add,
                        size: size,
                      )
                    : NonVisibleRoundButoon(
                        size: size,
                        text: 'auto',
                        icon: Icons.add,
                      ),
                AppSize().width20,
                RoundButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PotPage(
                                  size: size,
                                )));
                  },
                  text: 'pots',
                  icon: Icons.add,
                  size: size,
                ),
                AppSize().width20,
                RoundButton(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoldPage())),
                  text: 'Buy Gold',
                  icon: Icons.add,
                  size: size,
                ),
              ],
            ),
          ),
          Positioned(
              top: size.height * 0.60,
              left: size.width * 0.05,
              child: EarningContainer(
                size: size,
                onTap: _incrementCounter,
              ))
        ],
      ),
    );
  }
}

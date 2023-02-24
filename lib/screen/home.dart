import 'dart:developer';

import 'package:business_empire/screen/bank/bank_screen.dart';
import 'package:business_empire/screen/gold/gold.dart';
import 'package:business_empire/screen/pot/pot.dart';
import 'package:business_empire/screen/profile/profile_repo.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/custom_drawer.dart';
import 'package:business_empire/widgets/dialogue_box.dart';
import 'package:business_empire/widgets/earning_container.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static const String username = 'Salman';

  int clicks = 0;
  String greeting = 'Good Morning';
  // String upiId = '${username}123456@upi';
  bool isVisble = false;
  ValueNotifier earnings = EarningsRepo.earnings;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  // inifite = inifinite value to variable

  var infinite = double.infinity;

  // _infinitecounter() async {
  //   for (var i = 0; i < infinite; i++) {
  //     //Loop 100 times
  //     await Future.delayed(const Duration(seconds: 1), () {
  //       // Delay 500 milliseconds
  //       setState(() {
  //         earnings.value++; //Increment Counter
  //       });
  //     });
  //   }
  // }

  _increamentCounterFor1000() async {
    // EarningsRepo.earnings.value = EarningsRepo.earnings.value - 500;
    EarningsRepo.decreamentEarnings(500.0);
    EarningsRepo().setEarnings();
    EarningsRepo.increamentExpanses(500.0);
    EarningsRepo().setExp();

    for (var i = 0; i < 1000; i++) {
      //Loop 100 times
      // print(i);
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds

        earnings.value++; //Increment Counter
        EarningsRepo().setEarnings();
        if (i == 999) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Stopped'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (i == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Started'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  _increamentCounterFor2000() async {
    EarningsRepo.decreamentEarnings(600.0);
    EarningsRepo().setEarnings();
    EarningsRepo.increamentExpanses(600.0);
    EarningsRepo().setExp();
    for (var i = 0; i < 2000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds

        earnings.value++; //Increment Counter
        EarningsRepo().setEarnings();
        if (i == 1999) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Stopped'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (i == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Started'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  _increamentCounterFor3000() async {
    EarningsRepo.decreamentEarnings(800.0);
    EarningsRepo().setEarnings();
    EarningsRepo.increamentExpanses(800.0);
    EarningsRepo().setExp();
    for (var i = 0; i < 3000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds

        earnings.value++; //Increment earnings.value
        EarningsRepo().setEarnings();
        if (i == 2999) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Stopped'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (i == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Auto Click Started'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
    }
  }

  _incrementCounter() {
    setState(() {
      EarningsRepo.increamentEarnings(1);
      EarningsRepo().setEarnings();
      EarningsRepo.increamentClick();
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
    EarningsRepo.earnings.value = prefs.getDouble('earnings') ?? 0.0;
    // EarningsRepo.earnings.value = prefs.getDouble('earnings') ?? 0.0;
    log(prefs.getDouble('earnings').toString());
  }

  @override
  void initState() {
    getEarnings();
    ProfileRepo().getUserName();
    EarningsRepo.getTotalClick();
    ProfileRepo().getCardDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser!;
    final size = MediaQuery.of(context).size;
    return bgWidget(
      child: Scaffold(
        key: _key,
        // backgroundColor: lightGrey,
        drawer: CustonDrawer(
          profileImage: user!.photoURL!,
          userName: user.displayName!,
        ),
        body: Stack(
          children: [
            Column(
              children: const [
                // Container(
                //   width: size.width,
                //   height: size.height * 0.35,
                //   color: Colors.transparent,
                // ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        _key.currentState!.openDrawer();
                      },
                      icon: const Icon(
                        LineIcons.bars,
                        color: Colors.white,
                      ),
                    ),
                    AppSize().width20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,${user.displayName}',
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BankScreen()));
                },
                upiId: user.displayName!.substring(0, 6) + '12345@upi',
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
                            builder: (context) => GoldPage(
                                  size: size,
                                ))),
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
      ),
    );
  }
}

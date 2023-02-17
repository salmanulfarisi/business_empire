import 'package:business_empire/screen/gold.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/dialogue_box.dart';
import 'package:business_empire/widgets/earning_container.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
  int counter = 0;
  // inifite = inifinite value to variable

  var infinite = double.infinity;

  _infinitecounter() async {
    for (var i = 0; i < infinite; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          counter++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor1000() async {
    counter = counter - 500;
    for (var i = 0; i < 1000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          counter++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor2000() async {
    counter = counter - 600;
    for (var i = 0; i < 2000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          counter++; //Increment Counter
        });
      });
    }
  }

  _increamentCounterFor3000() async {
    counter = counter - 800;
    for (var i = 0; i < 3000; i++) {
      //Loop 100 times
      await Future.delayed(const Duration(seconds: 1), () {
        // Delay 500 milliseconds
        setState(() {
          counter++; //Increment Counter
        });
      });
    }
  }

  _incrementCounter() {
    setState(() {
      counter++;
    });
    if (counter == 10) {
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
    if (counter > 10) {
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

  @override
  void initState() {
    super.initState();

    // _incrementCounter();
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
              balance: counter,
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
                                  counter,
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
                  onTap: () {},
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

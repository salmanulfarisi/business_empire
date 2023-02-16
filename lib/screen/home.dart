import 'package:business_empire/screen/gold.dart';
import 'package:business_empire/utils/utils.dart';
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

  _incrementCounter() {
    setState(() {
      counter++;
    });
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
    String username = 'kunju';
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
                        onTap: _incrementCounter,
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

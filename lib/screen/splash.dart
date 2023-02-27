import 'dart:async';

import 'package:business_empire/screen/dashboard.dart';
import 'package:business_empire/screen/onboarding.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:business_empire/widgets/app_logo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getValidation();
  }

  Future getValidation() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

    // var isGoogle = prefs.getString('google');

    // if (isGoogle != null) {
    //   log('isLogin: $isGoogle');
    //   Timer(const Duration(seconds: 3), () {
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => const DashBoardPage()));
    //   });
    // } else {
    //   log('isLogin: $isGoogle');
    //   Timer(const Duration(seconds: 3), () {
    //     Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(builder: (context) => const OnboardingScreen()));
    //   });
    // }
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.offAll(() => const OnboardingScreen());
        } else {
          Get.offAll(() => const DashBoardPage());
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingCircle(
      color: Colors.white,
      size: 50.0,
    );
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              icSplashBg,
              width: 300,
            ),
          ),
          20.heightBox,
          appLogoWidget(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          10.heightBox,
          appversion.text.size(14).white.make(),
          const Spacer(),
          credits.text.size(14).white.make(),
          20.heightBox,
        ],
      )),
    );
  }
}

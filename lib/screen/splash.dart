import 'dart:async';

import 'package:business_empire/screen/dashboard.dart';
import 'package:business_empire/screen/onboarding.dart';
import 'package:business_empire/utils/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getString('email');
    var isPhone = prefs.getString('phone');
    var isGoogle = prefs.getString('google');

    if (isLogin != null || isPhone != null || isGoogle != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DashBoardPage()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()));
      });
    }
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
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.network(
          //     'https://cdn.pixabay.com/photo/2019/09/04/11/49/men-4451375_960_720.png'),
          CachedNetworkImage(
            imageUrl:
                "https://cdn.pixabay.com/photo/2019/09/04/11/49/men-4451375_960_720.png",
            imageBuilder: (context, imageProvider) => Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
          ),

          AppSize().height10,
          const Text('Business Empire',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          spinkit,
        ],
      )),
    );
  }
}

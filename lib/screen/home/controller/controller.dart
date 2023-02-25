// import 'dart:developer';

// import 'package:business_empire/widgets/money_repository.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MainHomeController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     getEarnings();
//   }

//   final countery = 0.0.obs;
//   double get count => countery.value;
//   set counter(double value) => countery.value = value;

//   increment() {
//     EarningsRepo.increamentEarnings(1);
//     EarningsRepo().setEarnings();
//     EarningsRepo.increamentClick();
//   }

//   getEarnings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     EarningsRepo.earnings.value = prefs.getDouble('earnings') ?? 0;
//     log(prefs.getDouble('earnings').toString());
//   }
// }

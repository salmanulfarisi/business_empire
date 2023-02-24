import 'package:business_empire/screen/wholesale/shop/controller/home_controller.dart';
import 'package:business_empire/screen/wholesale/shop/view/cart/cart_screen.dart';
import 'package:business_empire/screen/wholesale/shop/view/category/category_screen.dart';
import 'package:business_empire/screen/wholesale/shop/view/home/home_screen.dart';
import 'package:business_empire/screen/wholesale/shop/view/profile/profile_screen.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopOne extends StatelessWidget {
  final String title;
  const ShopOne({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navBarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: "home"),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: "categories"),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: "cart"),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: "profile"),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryHome(),
      const CartScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navBarItem,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
      ),
    );
  }
}

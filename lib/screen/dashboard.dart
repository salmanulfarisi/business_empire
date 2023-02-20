import 'package:business_empire/screen/home.dart';
import 'package:business_empire/screen/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int currentIndex = 0;
  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List page = [
    const HomePage(),
    const Text('Business'),
    const Text('School'),
    const Text('profile'),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: page[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          backgroundColor: const Color.fromARGB(255, 255, 87, 16),
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.building,
              ),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.bitcoin,
              ),
              label: 'Investment',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                LineIcons.shoppingCart,
              ),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
        ));
  }
}

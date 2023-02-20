import 'package:business_empire/screen/profile/profile_repo.dart';
import 'package:business_empire/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.livemint.com/img/2019/09/18/600x338/gold_1566100970267_1568799654293.jpg'),
                ),
                AppSize().height20,
                Text(
                  ProfileRepo.userName.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      ProfileRepo.upiId.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    AppSize().width10,
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: ProfileRepo.upiId.value),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('UPI ID Copied'),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.copy,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.black54,
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}

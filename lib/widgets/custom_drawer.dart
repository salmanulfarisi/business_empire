import 'package:business_empire/screen/onboarding.dart';
import 'package:business_empire/utils/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustonDrawer extends StatelessWidget {
  final String profileImage;
  final String userName;

  const CustonDrawer(
      {Key? key, required this.profileImage, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String upiId = userName.substring(0, 6) + '123456@upi';
    FirebaseAuth auth = FirebaseAuth.instance;

    void _signOut() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('google');
      await auth.signOut();
      await GoogleSignIn().signOut();
      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          (Route<dynamic> route) => false);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: profileImage,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  // child: const CircleAvatar(
                  //   radius: 30,
                  //   backgroundImage: NetworkImage(
                  //       'https://images.livemint.com/img/2019/09/18/600x338/gold_1566100970267_1568799654293.jpg'),
                  // ),
                ),
                AppSize().height20,
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      upiId,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    AppSize().width10,
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: upiId),
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
            title: const Text('Logout'),
            onTap: () {
              _signOut();
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

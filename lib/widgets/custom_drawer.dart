import 'package:business_empire/screen/onboarding.dart';
import 'package:business_empire/screen/seller_app/view/seller_app.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/services/firestore_sercices.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/wholesale.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:business_empire/utils/navigate_funtions.dart';
import 'package:business_empire/utils/size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    var controller = Get.put(ProfileController());

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
      child: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            String upiId = data['name'] + '123456@upi';
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl: controller.isGoogle.value == true
                            ? currentUser!.photoURL!
                            : data['imageUrl'] == ''
                                ? 'https://images.livemint.com/img/2019/09/18/600x338/gold_1566100970267_1568799654293.jpg'
                                : data['imageUrl'],
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
                        data['name'],
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
                  leading: const Icon(LineIcons.home, color: Colors.black54),
                  title: const Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LineIcons.shoppingCart,
                    color: Colors.black54,
                  ),
                  title: const Text("WholeSale Bussiness"),
                  onTap: () {
                    NavigateFunctions.pushPage(context, const WholeSaleBuss());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LineIcons.shoppingBasket,
                    color: Colors.black54,
                  ),
                  title: const Text("Sellet App"),
                  onTap: () {
                    NavigateFunctions.pushPage(context, const SellerAppLogin());
                  },
                ),
                ListTile(
                  leading: const Icon(
                    LineIcons.user,
                    color: Colors.black54,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    _signOut();
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

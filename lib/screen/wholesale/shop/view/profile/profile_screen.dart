import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/services/firestore_sercices.dart';
import 'package:business_empire/screen/wholesale/shop/view/chat_screen/message_screen.dart';
import 'package:business_empire/screen/wholesale/shop/view/order_screen/order_screen.dart';
import 'package:business_empire/screen/wholesale/shop/view/profile/edit_profile.dart';
import 'package:business_empire/screen/wholesale/shop/view/wishlist_screen/wishlist_screen.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/details_card.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/lists.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllr = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
        stream: FireStoreServices.getUser(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return SafeArea(
              child: Column(
                children: [
                  // edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                            alignment: Alignment.topRight,
                            child: const Icon(Icons.edit)
                                .box
                                .roundedFull
                                .make()
                                .pOnly(right: 8))
                        .onTap(() {
                      controllr.nameController.text = data['name'];

                      Get.to(() => EditProfile(data: data));
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        controllr.isGoogle.value == true
                            ? SizedBox(
                                height: size.height * 0.1,
                                width: size.width * 0.2,
                                child: Image.network(
                                  currentUser!.photoURL.toString(),
                                  width: 100,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                              )
                            : data['imageUrl'] == ''
                                ? Image.asset(
                                    imgProfile2,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ).box.roundedFull.clip(Clip.antiAlias).make()
                                : SizedBox(
                                    height: size.height * 0.1,
                                    width: size.width * 0.2,
                                    child: Image.network(
                                      data['imageUrl'],
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                                  ),
                        10.widthBox,
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${data['name']}"
                                .text
                                .fontFamily(semibold)
                                .black
                                .make(),
                            "${data['email']}"
                                .text
                                .fontFamily(semibold)
                                .black
                                .make(),
                          ],
                        )),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: const BorderSide(color: Colors.black),
                          ),
                          onPressed: () {},
                          child: logout.text.fontFamily(semibold).black.make(),
                        ).box.roundedFull.make()
                      ],
                    ),
                  ),
                  20.heightBox,
                  FutureBuilder(
                    future: FireStoreServices.getCounts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          ),
                        );
                      } else {
                        var countData = snapshot.data;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: "${countData[0]}",
                                title: "In your Cart"),
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: "${countData[1]}",
                                title: "In your Wishlist"),
                            detailsCard(
                                width: context.screenWidth / 3.4,
                                count: "${countData[2]}",
                                title: "Your Orders"),
                          ],
                        );
                      }
                    },
                  ),

                  10.heightBox,
                  // profile button list
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const OrderScren());

                              break;
                            case 1:
                              Get.to(() => const WishlistScreen());
                              break;
                            case 2:
                              Get.to(() => const MessagesScreen());
                              break;
                            default:
                          }
                        },
                        leading: Image.asset(
                          profileButtonIconList[index],
                          width: 22,
                          fit: BoxFit.cover,
                        ),
                        title: profileButtonList[index]
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: lightGrey),
                    itemCount: profileButtonList.length,
                  )
                      .box
                      .white
                      .rounded
                      .margin(const EdgeInsets.all(12))
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .make()
                      .box
                      .color(redColor)
                      .make()
                ],
              ),
            );
          }
        },
      )),
    );
  }
}

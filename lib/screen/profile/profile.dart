import 'package:awesome_card/awesome_card.dart';
import 'package:business_empire/screen/gold/gold_repo.dart';
import 'package:business_empire/screen/pot/pot_repo.dart';
import 'package:business_empire/screen/profile/profile_repo.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/services/firestore_sercices.dart';
import 'package:business_empire/screen/wholesale/shop/view/profile/edit_profile.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/details_card.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/lists.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    GoldRepo().getGold();
    PotRepo().getPotMoney();
    EarningsRepo().getExp();
    ProfileRepo().getUserName();
    ProfileRepo().getCardDetails();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(
                          width: context.screenWidth / 3.4,
                          count: "${EarningsRepo.earnings.value}",
                          title: "Cash In Hand"),
                      ValueListenableBuilder(
                        valueListenable: PotRepo.potMoney,
                        builder: (context, double value, child) => detailsCard(
                            width: context.screenWidth / 3.4,
                            count: "₹ " + value.toStringAsFixed(2),
                            title: "Cash In Pot"),
                      ),
                      ValueListenableBuilder(
                        valueListenable: GoldRepo.totalGold,
                        builder: (context, double value, child) => detailsCard(
                            width: context.screenWidth / 3.4,
                            count: value.toStringAsFixed(4) + "g",
                            title: "Total Gold"),
                      ),
                    ],
                  ),
                  10.heightBox,
                  // profile button list
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
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
                      .make(),
                  20.heightBox,
                  ValueListenableBuilder(
                    valueListenable: ProfileRepo.cardNumber,
                    builder: (context, value, child) => CreditCard(
                      cardNumber: value.toString(),
                      cardExpiry: '12/25',
                      cardHolderName: ProfileRepo.userName.value,
                      cvv: "123",
                      bankName: 'Sample Bank',
                      showBackSide: false,
                      frontBackground: CardBackgrounds.black,
                      backBackground: CardBackgrounds.white,
                      showShadow: true,
                      // mask: getCardTypeMask(cardType: CardType.americanExpress),
                    ),
                  ),
                  10.heightBox,
                  TextButton(
                    onPressed: () {
                      ProfileRepo().generateAccnum();
                      Future.delayed(const Duration(seconds: 3), () {
                        showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                            title: const Text('Account details'),
                            content: Text(
                                'Your Auto generated account number is ${ProfileRepo.cardNumber.value}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ProfileRepo().setcardDetails();
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok'),
                              )
                            ],
                          ),
                        );
                      });
                    },
                    child: const Text('Generate account number'),
                  )
                ],
              ),
            );
          }
        },
      )),
      // child: Scaffold(
      //   body: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: SingleChildScrollView(
      //         child: Column(
      //           children: [
      // const PlayerContainer(),
      //             AppSize().height20,
      //             Column(
      //               children: [
      //                 CreditCard(
      //                   cardNumber: ProfileRepo.cardNumber.value,
      //                   cardExpiry: '12/25',
      //                   cardHolderName: ProfileRepo.userName.value,
      //                   cvv: "123",
      //                   bankName: 'Sample Bank',
      //                   showBackSide: false,
      //                   frontBackground: CardBackgrounds.black,
      //                   backBackground: CardBackgrounds.white,
      //                   showShadow: true,
      //                   // mask: getCardTypeMask(cardType: CardType.americanExpress),
      //                 ),
      //                 AppSize().height20,
      //                 TextButton(
      //                   onPressed: () {
      //                     ProfileRepo().generateAccnum();
      //                     Future.delayed(const Duration(seconds: 3), () {
      //                       showDialog(
      //                         context: context,
      //                         builder: (builder) => AlertDialog(
      //                           title: const Text('Account details'),
      //                           content: Text(
      //                               'Your Auto generated account number is ${ProfileRepo.cardNumber.value}'),
      //                           actions: [
      //                             TextButton(
      //                               onPressed: () {
      //                                 ProfileRepo().setcardDetails();
      //                                 Navigator.pop(context);
      //                               },
      //                               child: const Text('Ok'),
      //                             )
      //                           ],
      //                         ),
      //                       );
      //                     });
      //                   },
      //                   child: const Text('Generate account number'),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

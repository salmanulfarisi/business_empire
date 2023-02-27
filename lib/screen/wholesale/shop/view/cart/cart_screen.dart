import 'package:business_empire/screen/wholesale/shop/controller/cart_controllr.dart';
import 'package:business_empire/screen/wholesale/shop/services/firestore_sercices.dart';
import 'package:business_empire/screen/wholesale/shop/view/cart/shipping.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        backgroundColor: lightGrey,
        bottomNavigationBar: SizedBox(
          width: context.screenWidth,
          height: 60,
          child: ourButton(
              color: redColor,
              onPress: () {
                Get.to(() => const ShippingDetails());
              },
              textColor: whiteColor,
              title: "Proceed to Shipping"),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: 'Shopping Cart'
              .text
              .color(darkFontGrey)
              .fontFamily(semibold)
              .make(),
        ),
        body: StreamBuilder(
            stream: FireStoreServices.getCart(currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "Cart is Empty".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                controller.calculate(data);
                controller.productSnapshot = data;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    leading: Image.network(
                                      "${data[index]['img']}",
                                      width: 80,
                                      fit: BoxFit.cover,
                                    ),
                                    title:
                                        "${data[index]['title']} x${data[index]['qty']}"
                                            .text
                                            .fontFamily(semibold)
                                            .size(16)
                                            .make(),
                                    subtitle: "${data[index]['totalPrice']}"
                                        .numCurrency
                                        .text
                                        .color(redColor)
                                        .fontFamily(semibold)
                                        .make(),
                                    trailing: const Icon(
                                      Icons.delete,
                                      color: redColor,
                                    ).onTap(() {
                                      FireStoreServices.deleteDocument(
                                          data[index].id);
                                    }));
                              })),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Total Price'
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make(),
                          // "₹ 1000"
                          Obx(
                            () => '${controller.totalP.value}'
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(redColor)
                                .make(),
                          )
                        ],
                      )
                          .box
                          .padding(const EdgeInsets.all(12))
                          .color(golden)
                          .width(context.screenWidth - 60)
                          .roundedSM
                          .make(),
                      10.heightBox,
                      // SizedBox(
                      //   width: context.screenWidth - 60,
                      //   child: ourButton(
                      //       color: redColor,
                      //       onPress: () {},
                      //       textColor: whiteColor,
                      //       title: "Proceed to Shipping"),
                      // )
                    ],
                  ),
                );
              }
            }));
  }
}

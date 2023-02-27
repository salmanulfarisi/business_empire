import 'package:business_empire/screen/wholesale/shop/controller/product_controller.dart';
import 'package:business_empire/screen/wholesale/shop/view/chat_screen/chat_screen.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/lists.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.resetValues();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.orange[800],
          title: title!.text.fontFamily(bold).make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
            Obx(
              () => IconButton(
                onPressed: () {
                  if (controller.isFav.value) {
                    controller.removeFromWishlist(data.id, context);
                  } else {
                    controller.addToWishList(data.id, context);
                  }
                },
                icon: Icon(
                  Icons.favorite_outline,
                  color: controller.isFav.value ? redColor : darkFontGrey,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // swiper section
                      VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        itemCount: data['p_imge'].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_imge'][index],
                            width: context.screenWidth,
                            fit: BoxFit.fill,
                          );
                        },
                      ),
                      10.heightBox,
                      title!.text.size(16).fontFamily(semibold).make(),
                      // rating
                      10.heightBox,
                      VxRating(
                        isSelectable: false,
                        value: double.parse(data['p_rating']),
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        size: 25,
                        count: 5,
                        maxRating: 5,
                      ),
                      10.heightBox,
                      "${data['p_price']}"
                          .numCurrency
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(18)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "${data['p_seller']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .size(16)
                                    .make()
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: whiteColor,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          ).onTap(() {
                            Get.to(() => const ChatScreen(), arguments: [
                              data['p_seller'],
                              data['vendor_id']
                            ]);
                          })
                        ],
                      )
                          .box
                          .height(60)
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldGrey)
                          .make(),

                      // color section
                      20.heightBox,
                      Obx(
                        () => Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child:
                                      "Color".text.color(textfieldGrey).make(),
                                ),
                                Row(
                                  children: List.generate(
                                      data['p_colors'].length,
                                      (index) => Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              VxBox()
                                                  .size(40, 40)
                                                  .roundedFull
                                                  .color(Color(data['p_colors']
                                                          [index])
                                                      .withOpacity(1.0))
                                                  .margin(const EdgeInsets
                                                      .symmetric(horizontal: 4))
                                                  .make()
                                                  .onTap(() {
                                                controller
                                                    .changeColorIndex(index);
                                              }),
                                              Visibility(
                                                visible: index ==
                                                    controller.colorIndex.value,
                                                child: const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          )),
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),

                            // Quantity row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity"
                                      .text
                                      .color(textfieldGrey)
                                      .make(),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          controller.decreaseQuantity();
                                          controller.calculateTotalPrice(
                                              int.parse(data['p_price']));
                                        },
                                      ),
                                      controller.quantity.value.text
                                          .size(16)
                                          .color(darkFontGrey)
                                          .fontFamily(bold)
                                          .make(),
                                      10.widthBox,
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          controller.increaseQuantity(
                                              int.parse(data['p_quantity']));
                                          controller.calculateTotalPrice(
                                              int.parse(data['p_price']));
                                        },
                                      ),
                                      "(${data['p_quantity']} available)"
                                          .text
                                          .color(textfieldGrey)
                                          .make(),
                                    ],
                                  ),
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),

                            // total ROw
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child:
                                      "Total".text.color(textfieldGrey).make(),
                                ),
                                Row(
                                  children: [
                                    "${controller.totalPrice.value}"
                                        .numCurrency
                                        .text
                                        .size(16)
                                        .color(redColor)
                                        .fontFamily(bold)
                                        .make(),
                                  ],
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ],
                        ).box.white.shadowSm.make(),
                      ),
                      // description
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "${data['p_description']}"
                          .text
                          .color(darkFontGrey)
                          .make(),
                      //  buttons section
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(
                          itemDetailButtonList.length,
                          (index) => ListTile(
                            title: itemDetailButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      20.heightBox,
                      // product you may like
                      productsyoumaylike.text
                          .fontFamily(bold)
                          .size(16)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(
                              6,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      10.heightBox,
                                      "Laptop 4GB/64GB"
                                          .text
                                          .fontFamily(semibold)
                                          .color(darkFontGrey)
                                          .make(),
                                      10.heightBox,
                                      "\$600"
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .size(16)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .white
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .roundedSM
                                      .padding(const EdgeInsets.all(8))
                                      .make()),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                color: redColor,
                onPress: () {
                  controller.addtoCart(
                    color: data['p_colors'][controller.colorIndex.value],
                    context: context,
                    vendorId: data['vendor_id'],
                    img: data['p_imge'][0],
                    qty: controller.quantity.value,
                    sellername: data['p_seller'],
                    title: data['p_name'],
                    totalPrice: controller.totalPrice.value,
                  );
                  VxToast.show(context, msg: "Added to Cart");
                },
                textColor: whiteColor,
                title: "Add to Cart",
              ),
            )
          ],
        ),
      ),
    );
  }
}

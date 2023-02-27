import 'package:business_empire/screen/wholesale/shop/controller/cart_controllr.dart';
import 'package:business_empire/screen/wholesale/shop/shop.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/lists.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(
          () => Column(
              children: List.generate(paymentMethodList.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.changePaymentIndex(index);
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: controller.paymentIndex.value == index
                        ? redColor
                        : Colors.transparent,
                    width: 4,
                    style: BorderStyle.solid,
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      paymentMethodList[index],
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                      colorBlendMode: controller.paymentIndex.value == index
                          ? BlendMode.darken
                          : BlendMode.color,
                      color: controller.paymentIndex.value == index
                          ? Colors.black.withOpacity(0.4)
                          : Colors.transparent,
                    ),
                    controller.paymentIndex.value == index
                        ? Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              activeColor: Colors.green,
                              value: true,
                              onChanged: (value) {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          )
                        : Container(),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: paymentMethodTitle[index]
                          .text
                          .fontFamily(semibold)
                          .white
                          .size(16)
                          .make(),
                    )
                  ],
                ),
              ),
            );
          })),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: context.screenWidth,
        height: 60,
        child: controller.placingOrder.value
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              )
            : ourButton(
                onPress: () async {
                  await controller.placeMyOrder(
                      orderPaymentMethod:
                          paymentMethodTitle[controller.paymentIndex.value],
                      totalAmount: controller.totalP.value);
                  await controller.clearCart();
                  VxToast.show(context, msg: "Order Placed Successfully");
                  Get.offAll(() => const ShopOne(
                        title: '',
                      ));
                },
                color: redColor,
                textColor: whiteColor,
                title: 'Place my Order',
              ),
      ),
    );
  }
}

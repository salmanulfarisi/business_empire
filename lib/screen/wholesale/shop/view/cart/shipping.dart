import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/wholesale/shop/controller/cart_controllr.dart';
import 'package:business_empire/screen/wholesale/shop/view/cart/payment_methode.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Shipping Info'
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(
                hint: 'Address',
                ispass: false,
                title: 'Address',
                controller: controller.addressControllr),
            customTextField(
                hint: 'City',
                ispass: false,
                title: 'City',
                controller: controller.cityControllr),
            customTextField(
                hint: 'State',
                ispass: false,
                title: 'State',
                controller: controller.stateControllr),
            customTextField(
                hint: 'Postal Code',
                ispass: false,
                title: 'Postal Code',
                controller: controller.postalCodeControllr),
            customTextField(
                hint: 'Phone',
                ispass: false,
                title: 'Phone',
                controller: controller.phoneControllr),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: context.screenWidth,
        height: 60,
        child: ourButton(
          onPress: () {
            if (controller.addressControllr.text.length > 10) {
              Get.to(() => const PaymentMethods());
            } else {
              VxToast.show(context, msg: 'Please Enter Valid Address');
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: 'Continue',
        ),
      ),
    );
  }
}

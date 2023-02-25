import 'package:business_empire/screen/auth/controller/auth_controller.dart';
import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/dashboard.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTextField(
                        title: email,
                        hint: emailHint,
                        controller: controller.emailController,
                        ispass: false),
                    customTextField(
                        title: password,
                        hint: passwordHint,
                        controller: controller.passwordController,
                        ispass: true),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: forgetPassword.text.make()),
                    ),
                    5.heightBox,
                    controller.isloading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: redColor,
                            textColor: whiteColor,
                            title: login,
                            onPress: () async {
                              controller.isloading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(() => const DashBoardPage());
                                } else {
                                  controller.isloading(false);
                                }
                              });
                            }).box.width(context.screenWidth).make(),
                    5.heightBox,
                    createNewAcc.text.color(fontGrey).make(),
                    5.heightBox,
                    ourButton(
                        color: golden,
                        textColor: whiteColor,
                        title: signup,
                        onPress: () {
                          Get.to(() => const SignupScreen());
                        }).box.width(context.screenWidth).make()
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

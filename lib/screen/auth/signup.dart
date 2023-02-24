import 'package:business_empire/screen/auth/login_screen.dart';
import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Sign up to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customTextField(
                      title: name, hint: nameHint, controller: null),
                  customTextField(
                      title: email, hint: emailHint, controller: null),
                  customTextField(
                      title: password, hint: passwordHint, controller: null),
                  customTextField(
                      title: retypePassword,
                      hint: passwordHint,
                      controller: null),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        value: true,
                        onChanged: (value) {},
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: termsConditions,
                            style: TextStyle(fontFamily: bold, color: redColor),
                          ),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(fontFamily: bold, color: fontGrey),
                          ),
                          TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(fontFamily: bold, color: redColor),
                          ),
                        ])),
                      )
                    ],
                  ),
                  5.heightBox,
                  ourButton(
                          color: redColor,
                          textColor: whiteColor,
                          title: signup,
                          onPress: () {})
                      .box
                      .width(context.screenWidth)
                      .make(),
                  10.heightBox,
                  RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: alreadyHaveAcc,
                      style: TextStyle(fontFamily: bold, color: fontGrey),
                    ),
                    TextSpan(
                      text: login,
                      style: TextStyle(fontFamily: bold, color: redColor),
                    ),
                  ])).onTap(() {
                    Get.to(() => const LoginScreen());
                  })
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}

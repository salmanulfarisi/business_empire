import 'package:business_empire/screen/auth/controller/auth_controller.dart';
import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/dashboard.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:business_empire/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isChecked = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();

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
                      title: name, hint: nameHint, controller: nameController),
                  customTextField(
                      title: email,
                      hint: emailHint,
                      controller: emailController),
                  customTextField(
                      title: password,
                      hint: passwordHint,
                      controller: passwordController),
                  customTextField(
                      title: retypePassword,
                      hint: passwordHint,
                      controller: retypePasswordController),
                  5.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: "I agree to the ",
                            style:
                                TextStyle(fontFamily: regular, color: fontGrey),
                          ),
                          TextSpan(
                            text: termsConditions,
                            style:
                                TextStyle(fontFamily: regular, color: redColor),
                          ),
                          TextSpan(
                            text: " & ",
                            style:
                                TextStyle(fontFamily: regular, color: fontGrey),
                          ),
                          TextSpan(
                            text: privacyPolicy,
                            style:
                                TextStyle(fontFamily: regular, color: redColor),
                          ),
                        ])),
                      )
                    ],
                  ),
                  5.heightBox,
                  ourButton(
                      color: isChecked == true ? redColor : lightGrey,
                      textColor: whiteColor,
                      title: signup,
                      onPress: () async {
                        if (isChecked != false) {
                          try {
                            await controller
                                .signUpMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              return controller.storeUserData(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                              );
                            }).then((value) {
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(() => const DashBoardPage());
                            });
                          } catch (e) {
                            auth.signOut();
                            VxToast.show(context, msg: e.toString());
                          }
                        }
                      }).box.width(context.screenWidth).make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      alreadyHaveAcc.text.color(fontGrey).make(),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: login.text.color(redColor).make())
                    ],
                  )
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

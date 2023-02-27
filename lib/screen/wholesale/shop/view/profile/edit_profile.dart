import 'dart:io';

import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final dynamic data;
  const EditProfile({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    final size = MediaQuery.of(context).size;
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.isGoogle.value == true
                  ? SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                      child: Image.network(
                        currentUser!.photoURL.toString(),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                    )
                  : data['imageUrl'] == "" && controller.profilePath.isEmpty
                      ? Image.asset(
                          imgProfile2,
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : data['imageUrl'] != '' && controller.profilePath.isEmpty
                          ? SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                              child: Image.network(
                                data['imageUrl'],
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                            )
                          : SizedBox(
                              height: size.height * 0.1,
                              width: size.width * 0.2,
                              child: Image.file(
                                File(controller.profilePath.value),
                                width: 100,
                                fit: BoxFit.cover,
                              ).box.roundedFull.clip(Clip.antiAlias).make(),
                            ),
              10.heightBox,
              controller.isGoogle.value
                  ? ourButton(
                      color: lightGrey,
                      onPress: () {
                        VxToast.show(context, msg: "Can't Change");
                      },
                      textColor: whiteColor,
                      title: "Change")
                  : ourButton(
                      color: redColor,
                      onPress: () {
                        controller.changeImage(context);
                      },
                      textColor: whiteColor,
                      title: "Change"),
              const Divider(),
              20.heightBox,
              customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                ispass: false,
              ),
              10.heightBox,
              customTextField(
                controller: controller.oldPassController,
                hint: passwordHint,
                title: oldpass,
                ispass: true,
              ),
              10.heightBox,
              customTextField(
                controller: controller.newPassController,
                hint: passwordHint,
                title: newpass,
                ispass: true,
              ),
              20.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: double.infinity,
                      // context.screenWidth-60,
                      child: ourButton(
                          color: redColor,
                          onPress: () async {
                            controller.isLoading(true);
                            if (controller.profilePath.value.isNotEmpty) {
                              await controller.uploadProfileImg();
                            } else {
                              controller.profileImageLink.value =
                                  data['imageUrl'];
                            }
                            if (data['password'] ==
                                controller.oldPassController.text) {
                              await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldPassController.text,
                                newPassword: controller.newPassController.text,
                              );
                              await controller.updateProfile(
                                imgUrl: controller.profileImageLink.value,
                                name: controller.nameController.text,
                                pass: controller.newPassController.text,
                              );
                              VxToast.show(context, msg: "Profile Updated");
                            } else {
                              VxToast.show(context, msg: "Wrong Old Password");
                              controller.isLoading(false);
                            }
                          },
                          textColor: whiteColor,
                          title: "Save"),
                    ),
            ],
          )
              .box
              .white
              .rounded
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 16, right: 16))
              .make(),
        ),
      ),
    );
  }
}

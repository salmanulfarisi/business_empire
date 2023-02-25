import 'dart:io';

import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
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
              data['imageUrl'] == "" && controller.profilePath.isEmpty
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
              ourButton(
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
              customTextField(
                controller: controller.passController,
                hint: passwordHint,
                title: password,
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
                            await controller.uploadProfileImg();
                            await controller.updateProfile(
                              imgUrl: controller.profileImageLink.value,
                              name: controller.nameController.text,
                              pass: controller.passController.text,
                            );
                            VxToast.show(context, msg: "Profile Updated");
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

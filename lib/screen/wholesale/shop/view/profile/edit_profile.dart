import 'dart:io';

import 'package:business_empire/screen/auth/widget/custom_textfield.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/our_button.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profilePath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profilePath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
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
                hint: nameHint,
                title: name,
                ispass: false,
              ),
              customTextField(
                hint: passwordHint,
                title: password,
                ispass: true,
              ),
              20.heightBox,
              SizedBox(
                width: double.infinity,
                // context.screenWidth-60,
                child: ourButton(
                    color: redColor,
                    onPress: () {},
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

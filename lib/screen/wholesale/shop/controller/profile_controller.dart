import 'dart:io';

import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profilePath = ''.obs;
  var profileImageLink = ''.obs;
  var isLoading = false.obs;
  // textFields
  var nameController = TextEditingController();
  var passController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profilePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImg() async {
    var filename = basename(profilePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profilePath.value));
    profileImageLink.value = await ref.getDownloadURL();
  }

  updateProfile({name, pass, imgUrl}) async {
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': pass,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isLoading(false);
  }
}

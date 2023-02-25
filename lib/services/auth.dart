import 'dart:developer';

import 'package:business_empire/screen/dashboard.dart';
import 'package:business_empire/screen/wholesale/shop/controller/profile_controller.dart';
import 'package:business_empire/utils/navigate_funtions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  var controller = Get.put(() => ProfileController());

  FirebaseAuthMethods(this._auth);

  User get currentUser => _auth.currentUser!;
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // if (kIsWeb) {
      //   GoogleAuthProvider googleProvider = GoogleAuthProvider();

      //   googleProvider
      //       .addScope('https://www.googleapis.com/auth/contacts.readonly');

      //   await _auth.signInWithPopup(googleProvider);
      // } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: 'Login Successful');
          NavigateFunctions.pushReplacePage(context, const DashBoardPage());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('google', currentUser.email!);
        } else {
          Fluttertoast.showToast(msg: 'Login Failed');
        }

        // Fluttertoast.showToast(msg: 'Login Successful');
        // NavigateFunctions.pushReplacePage(context, const NavbarScreen());
        // if you want to do specific task like storing information in firestore
        // only for new users using google sign in (since there are no two options
        // for google sign in and google sign up, only one as of now),
        // do the following:

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            addUserDetails();
          } else {
            // do something else for existing users
          }
        }
      }
      // }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      log(e.message.toString());
    }
  }

  Future addUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .set({
      'id': currentUser.uid,
      'name': '',
      'email': currentUser.email,
      'password': '',
      'imageUrl': currentUser.photoURL,
      "cart_count": "00",
      "wishlist_count": "00",
      "order_count": "00",
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
    });
  }
}

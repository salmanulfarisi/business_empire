import 'package:business_empire/screen/wholesale/shop/controller/home_controller.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  // text controllr for shipping
  var addressControllr = TextEditingController();
  var cityControllr = TextEditingController();
  var stateControllr = TextEditingController();
  var postalCodeControllr = TextEditingController();
  var phoneControllr = TextEditingController();

  var paymentIndex = 0.obs;

  late dynamic productSnapshot;
  var products = [];

  var placingOrder = false.obs;

  calculate(data) {
    totalP.value = 0;

    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]["totalPrice"].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().userName,
      'order_by_email': currentUser!.email,
      'order_by_address': addressControllr.text,
      'order_by_city': cityControllr.text,
      'order_by_state': stateControllr.text,
      'order_by_postal_code': postalCodeControllr.text,
      'order_by_phone': phoneControllr.text,
      'shipping_method': 'Home Delivery',
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confiremed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'img': productSnapshot[i]['img'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'totalPrice': productSnapshot[i]['totalPrice'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
  }
}

import 'package:business_empire/screen/wholesale/shop/model/category_model.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/firebase_consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  var isFav = false.obs;
  var subcat = [];
  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle
        .loadString("lib/screen/wholesale/shop/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();
    for (var e in s[0].subcategories) {
      subcat.add(e);
    }
  }

  changeColorIndex(int index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addtoCart({title, img, sellername, color, qty, totalPrice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'totalPrice': totalPrice,
      'addedby': currentUser!.uid,
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    quantity.value = 0;
    colorIndex.value = 0;
    totalPrice.value = 0;
  }

  addToWishList(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_whishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Added to Wishlist");
  }

  removeFromWishlist(docId, context) async {
    await firestore.collection(productCollection).doc(docId).set({
      'p_whishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Removed from Wishlist");
  }

  checkIfFav(data) async {
    if (data['p_whishlist'].contains(currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}

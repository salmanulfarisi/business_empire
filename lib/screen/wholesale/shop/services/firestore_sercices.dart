import 'package:business_empire/utils/firebase_consts.dart';

class FireStoreServices {
  // get user data
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  // get product according to catergory
  static getProducts(category) {
    return firestore
        .collection(productCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  // get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('addedby', isEqualTo: uid)
        .snapshots();
  }

  // delete document
  static deleteDocument(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }

  // get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  // get all orders
  static getOrders() {
    return firestore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // get all wishlist
  static getWishlist() {
    return firestore
        .collection(productCollection)
        .where('p_whishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  // get all messages
  static getAllMessages() {
    return firestore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  // get counts
  static getCounts() async {
    var res = await Future.wait([
      firestore
          .collection(cartCollection)
          .where('addedby', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(productCollection)
          .where('p_whishlist', arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(ordersCollection)
          .where('order_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  // all products
  static allProducts() {
    return firestore.collection(productCollection).snapshots();
  }
}

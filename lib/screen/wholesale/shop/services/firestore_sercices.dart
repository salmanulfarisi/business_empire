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
}

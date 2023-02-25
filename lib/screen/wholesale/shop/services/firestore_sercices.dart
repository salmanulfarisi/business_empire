import 'package:business_empire/utils/firebase_consts.dart';

class FireStoreServices {
  // get user data
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}

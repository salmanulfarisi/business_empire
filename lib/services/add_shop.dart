import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddshopService {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  final user = FirebaseAuth.instance.currentUser;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static List<DocumentSnapshot> shopData = [];

  Future<void> addShopData(String name, String type, String imageUrl) async {
    final userDocRef = usersCollection.doc(user!.uid);
    final subCollectionRef = userDocRef.collection('shops');

    // CollectionReference shops = FirebaseFirestore.instance.collection('shops');
    Map<String, dynamic> data = {
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
    };
    await subCollectionRef.add(data);
    // final shopRef = await subCollectionRef.add(data);
    // // await shopRef.update({'userRef': usersCollection.doc(user!.uid)});
    // await usersCollection.doc(uid).update({
    //   'shops': FieldValue.arrayUnion([shopRef.id])
    // });
  }

  // Future<void> getShopData() async {
  //   final firestore = FirebaseFirestore.instance;
  //   final querySnapshot = await firestore.collection('shops').get();
  //   shopData.addAll(querySnapshot.docs);
  // }
}

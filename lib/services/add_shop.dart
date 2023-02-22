import 'package:cloud_firestore/cloud_firestore.dart';

class AddshopService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static List<DocumentSnapshot> shopData = [];

  Future<void> addShopData(String name, String type, String imageUrl) async {
    final firestore = FirebaseFirestore.instance;
    firestore.collection('shops').add({
      'name': name,
      'type': type,
      'imageUrl': imageUrl,
    });
  }

  // Future<void> getShopData() async {
  //   final firestore = FirebaseFirestore.instance;
  //   final querySnapshot = await firestore.collection('shops').get();
  //   shopData.addAll(querySnapshot.docs);
  // }
}

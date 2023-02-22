import 'package:business_empire/model/new_shop.dart';
import 'package:business_empire/screen/bussiness/current_shop.dart';
import 'package:business_empire/screen/bussiness/widgets/bussiness_container.dart';
import 'package:business_empire/screen/bussiness/widgets/my_bussinesses_card.dart';
import 'package:business_empire/screen/bussiness/widgets/offline_business.dart';
import 'package:business_empire/services/add_shop.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/style.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BussinessPage extends StatefulWidget {
  const BussinessPage({Key? key}) : super(key: key);

  @override
  State<BussinessPage> createState() => _BussinessPageState();
}

class _BussinessPageState extends State<BussinessPage> {
  @override
  void initState() {
    super.initState();
    newShop = [];
    getShopData();
  }

  Future<void> getShopData() async {
    final firestore = FirebaseFirestore.instance;
    final querySnapshot = await firestore.collection('shops').get();
    setState(() {
      AddshopService.shopData = querySnapshot.docs;
    });
  }

  Stream<QuerySnapshot> _getShopDataStream() {
    final firestore = FirebaseFirestore.instance;
    final stream = firestore.collection('shops').snapshots();
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Bussiness Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const BussinessContainer(),
            AppSize().height20,
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    size: size,
                    text: "offline bussiness",
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Offline()));
                      setState(() {});
                      print(newShop.length);
                    },
                  ),
                ),
                AppSize().width10,
                Expanded(
                  child: ButtonWidget(
                    size: size,
                    text: "online bussiness",
                  ),
                ),
              ],
            ),
            AppSize().height20,
            const Text(
              "My Bussiness",
              style: AppStyle.title2,
            ),
            AppSize().height20,
            StreamBuilder<QuerySnapshot>(
              stream: _getShopDataStream(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final shopData = snapshot.data!.docs;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: shopData.length,
                    itemBuilder: (context, index) {
                      final shop = shopData[index];
                      return GestureDetector(
                        onTap: () {
                          print(shop['name'][index]);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurrentShop(
                                        title: shop['name'],
                                        shopImage: shop['imageUrl'],
                                      )));
                        },
                        child: MyBussinessess(
                          size: size,
                          shopImage: shop['imageUrl'],
                          shopName: shop['name'],
                          shopType: shop['type'],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => AppSize().height20,
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error loading shop data');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),

            // child: ListView.separated(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: AddshopService.shopData.isEmpty
            //       ? 1
            //       : AddshopService.shopData.length,
            //   itemBuilder: (context, index) {
            //     if (AddshopService.shopData.isEmpty) {
            //       return GestureDetector(
            //         onTap: () async {
            //           await Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const Offline()));
            //           setState(() {});
            //         },
            //         child: MyBussinessess(
            //           size: size,
            //           shopImage:
            //               "https://images.unsplash.com/photo-1599991271439-cdcfc90096cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
            //           shopName: "Unknown Shop",
            //           shopType: "Add your shop",
            //         ),
            //       );
            //     }
            //     final shop = AddshopService.shopData[index];
            //     return GestureDetector(
            //       onTap: () {
            //         print(shop['name'][index]);
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => CurrentShop(
            //                       title: shop['name'],
            //                       shopImage: shop['imageUrl'],
            //                     )));
            //       },
            //       child: MyBussinessess(
            //         size: size,
            //         shopImage: shop['imageUrl'],
            //         shopName: shop['name'],
            //         shopType: shop['type'],
            //       ),
            //     );
            //   },
            //   separatorBuilder: (context, index) => AppSize().height20,
            // ),
          ],
        ),
      ),
    );
  }
}
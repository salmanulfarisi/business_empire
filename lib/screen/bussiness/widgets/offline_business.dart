import 'package:business_empire/model/offline_shops.dart';
import 'package:business_empire/screen/bussiness/shop_add.dart';
import 'package:business_empire/screen/bussiness/widgets/shop_container.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/strings.dart';
import 'package:business_empire/utils/style.dart';
import 'package:flutter/material.dart';

class Offline extends StatefulWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  List<OfflineShops> shops = [
    OfflineShops(
      image: dressShopImage,
      name: "dressShop",
      price: 1000,
    ),
    OfflineShops(
      image: backeryShopImage,
      name: "Backery",
      price: 2000,
    ),
    OfflineShops(
      image: shoeShopImage,
      name: "Shoe Shop",
      price: 3500,
    ),
    OfflineShops(
      image: stationoryShopImage,
      name: "Stationary Shop",
      price: 2500,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 250,
              child: Text(
                'Choose a new business Category',
                style: AppStyle.title2,
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const Text("Shop", style: AppStyle.title2),
            AppSize().height20,
            Expanded(
              child: GridView.custom(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShopAdd(
                                      title: shops[index].name,
                                      price: shops[index].price,
                                      index: index,
                                    )));
                      },
                      child: ShopContainer(
                        shopImage: shops[index].image,
                        shopName: shops[index].name,
                        shopPrice: shops[index].price,
                      ),
                    );
                  },
                  childCount: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

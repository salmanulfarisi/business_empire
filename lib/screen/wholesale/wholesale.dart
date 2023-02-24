import 'package:business_empire/model/offline_shops.dart';
import 'package:business_empire/screen/wholesale/shop/shop.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/widgets/wholesale_shop.dart';
import 'package:business_empire/utils/navigate_funtions.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/strings.dart';
import 'package:business_empire/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/wholesale_container.dart';

class WholeSaleBuss extends StatefulWidget {
  const WholeSaleBuss({Key? key}) : super(key: key);

  @override
  State<WholeSaleBuss> createState() => _WholeSaleBussState();
}

class _WholeSaleBussState extends State<WholeSaleBuss> {
  bool _isLoading = false;
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
  void initState() {
    super.initState();
    _getWholeSale();
  }

  Future _getWholeSale() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: redColor,
        title: const Text('WholeSaleBuss'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _isLoading
                ? Shimmer.fromColors(
                    child: Container(
                      width: size.width,
                      height: size.height * 0.2,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  )
                : const WholeSaleContainer(),
            AppSize().height20,
            const Text(
              "WholeSale Shops",
              style: AppStyle.title2,
            ),
            Divider(
              endIndent: size.width * 0.4,
              color: Colors.grey,
              thickness: 2,
            ),
            AppSize().height20,
            GridView.custom(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _isLoading
                      ? Shimmer.fromColors(
                          child: Container(
                            width: size.width,
                            height: size.height * 0.2,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.orange[800],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                        )
                      : GestureDetector(
                          onTap: () {
                            NavigateFunctions.pushPage(
                                context,
                                ShopOne(
                                  title: shops[index].name,
                                ));
                          },
                          child: WholeSaleShops(
                            wholesaleImage: shops[index].image,
                            wholesaleName: shops[index].name,
                          ),
                        );
                },
                childCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

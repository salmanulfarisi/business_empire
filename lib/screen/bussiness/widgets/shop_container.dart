import 'package:business_empire/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShopContainer extends StatelessWidget {
  final String shopImage;
  final String shopName;
  final double shopPrice;
  const ShopContainer(
      {Key? key,
      required this.shopImage,
      required this.shopName,
      required this.shopPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: shopImage,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          // child: Container(
          //   decoration: BoxDecoration(
          //     color: Colors.orange[800],
          //     borderRadius: BorderRadius.circular(10),
          //     image: DecorationImage(
          //       image: NetworkImage(shopImage),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.orange[800],
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 10,
          child: Text(
            shopName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Text(
            "Start from ₹$shopPrice",
            style: AppStyle.bodyGrey,
          ),
        ),
      ],
    );
  }
}

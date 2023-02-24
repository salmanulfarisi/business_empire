import 'package:business_empire/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WholeSaleShops extends StatelessWidget {
  final String wholesaleImage;
  final String wholesaleName;
  const WholeSaleShops(
      {Key? key, required this.wholesaleImage, required this.wholesaleName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: wholesaleImage,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Colors.orange[800],
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.store,
              size: 50,
              color: Colors.white,
            ),
            AppSize().height10,
            Text(
              wholesaleName,
              style: AppStyle.title,
            ),
          ],
        ),
      ),
    );
  }
}

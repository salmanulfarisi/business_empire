import 'package:business_empire/utils/strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BussinessContainer extends StatelessWidget {
  const BussinessContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        CachedNetworkImage(
          imageUrl: bussinessImage,
          imageBuilder: (context, imageProvider) => Container(
            height: size.width * 0.5,
            width: size.width,
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
          //   height: size.width * 0.5,
          //   width: size.width,
          //   decoration: BoxDecoration(
          //     color: Colors.orange[800],
          //     borderRadius: BorderRadius.circular(10),
          //     image: const DecorationImage(
          //       image: NetworkImage(bussinessImage),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ),
        Container(
          height: size.width * 0.5,
          width: size.width,
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            bottom: size.width * 0.05,
          ),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Bussiness',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'A business is an organization or enterprising entity engaged in commercial, industrial, or professional activities. Businesses can be for-profit entities or nonprofit organizations that operate to fulfill a charitable mission or further a social cause.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

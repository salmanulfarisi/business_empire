import 'package:business_empire/utils/strings.dart';
import 'package:business_empire/utils/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GoldContainer extends StatelessWidget {
  const GoldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: goldImage,
          imageBuilder: (context, imageProvider) => Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          // child: Container(
          //   padding: const EdgeInsets.all(16),
          //   width: double.infinity,
          //   height: size.height * 0.2,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[300],
          //     borderRadius: BorderRadius.circular(20),
          //     image: const DecorationImage(
          //       image: NetworkImage(goldImage),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
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
            children: const [
              Text(
                'Digital Gold',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Digital gold currency is a form of electronic money based on mass units of gold. It is a kind of representative money, like a US paper gold certificate at the time that these were exchangeable for gold on demand',
                style: AppStyle.bodyGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:business_empire/utils/style.dart';
import 'package:flutter/material.dart';

class CurrentShop extends StatelessWidget {
  final String title;
  final String shopImage;
  const CurrentShop({Key? key, required this.title, required this.shopImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      image: DecorationImage(
                        image: NetworkImage(Uri.parse(shopImage).toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
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
                    top: 20,
                    left: 5,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 5,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: size.width / 2 - 100,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: AppStyle.title,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.22 - 50,
            left: 20,
            right: 20,
            child: Container(
              height: size.height * 0.2,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Your Shop Earned", style: AppStyle.subtitleBlack),
                      Text("₹ 0", style: AppStyle.title2),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Total Products", style: AppStyle.subtitleBlack),
                      Text("0 Products", style: AppStyle.bodyGrey),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

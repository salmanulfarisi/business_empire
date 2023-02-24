import 'package:business_empire/screen/wholesale/shop/view/category/item_details.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .gray300
                        .rounded
                        .size(150, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),

            // items container
            20.heightBox,
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 250,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP5,
                        height: 150,
                        width: 200,
                        fit: BoxFit.fill,
                      ),
                      "Laptop 4GB/64GB"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      "\$600"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(16)
                          .make()
                    ],
                  )
                      .box
                      .white
                      .margin(const EdgeInsets.symmetric(horizontal: 4))
                      .roundedSM
                      .padding(const EdgeInsets.all(12))
                      .make()
                      .onTap(() {
                    Get.to(() => const ItemDetails(title: "Laptop 4GB/64GB"));
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

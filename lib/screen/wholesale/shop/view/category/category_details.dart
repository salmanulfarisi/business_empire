import 'package:business_empire/screen/wholesale/shop/controller/product_controller.dart';
import 'package:business_empire/screen/wholesale/shop/services/firestore_sercices.dart';
import 'package:business_empire/screen/wholesale/shop/view/category/item_details.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var controller = Get.put(ProductController());
  dynamic productMethod;
  @override
  void initState() {
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title) {
    if (controller.subcat.contains(title)) {
      productMethod = FireStoreServices.getSubCategoryProducts(title);
    } else {
      productMethod = FireStoreServices.getProducts(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(
            title: widget.title!.text.fontFamily(bold).white.make(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                        controller.subcat.length,
                        (index) => "${controller.subcat[index]}"
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .makeCentered()
                                .box
                                .gray300
                                .rounded
                                .size(120, 50)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make()
                                .onTap(() {
                              switchCategory("${controller.subcat[index]}");
                              setState(() {});
                            })),
                  ),
                ),
                20.heightBox,
                StreamBuilder(
                  stream: productMethod,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return const Expanded(
                        child: Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return Expanded(
                          child: "No Products Found"
                              .text
                              .color(darkFontGrey)
                              .makeCentered());
                    } else {
                      var data = snapshot.data!.docs;
                      return Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 250,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]['p_imge'][0],
                                  height: 150,
                                  width: 200,
                                  fit: BoxFit.fill,
                                ),
                                10.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "${data[index]['p_price']}"
                                    .numCurrency
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .padding(const EdgeInsets.all(12))
                                .make()
                                .onTap(() {
                              controller.checkIfFav(data[index]);
                              Get.to(() => ItemDetails(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ));
                            });
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}

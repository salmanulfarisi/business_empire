import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerProductDetails extends StatelessWidget {
  const SellerProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: "product name", color: darkGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgProduct,
                  width: context.screenWidth,
                  fit: BoxFit.fill,
                );
              },
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: 'product name', color: white, size: 16.0),
                  // title!.text.size(16).fontFamily(semibold).make(),
                  // rating
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    size: 25,
                    count: 5,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  boldText(text: '\$300', color: red, size: 18.0),

                  20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: 'color', color: darkGrey),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor.withOpacity(1.0))
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()
                                  .onTap(() {
                                // controller.changeColorIndex(index);
                              }),
                              // Visibility(
                              //   visible: index ==
                              //       controller.colorIndex.value,
                              //   child: const Icon(
                              //     Icons.done,
                              //     color: Colors.white,
                              //   ),
                              // )
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      // Quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: 'Quantity', color: darkGrey),
                          ),
                          normalText(text: '20 items', color: fontGrey)
                        ],
                      ),

                      // total ROw
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  // description
                  10.heightBox,
                  boldText(text: 'Description', color: fontGrey),
                  10.heightBox,
                  normalText(text: "Deslfj;ljsdvsfjvl;df;dfj", color: fontGrey)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

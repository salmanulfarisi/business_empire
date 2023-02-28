import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/orders/widgets/seller_order_place.dart';
import 'package:business_empire/screen/seller_app/view/widgets/button_widget.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerOrderDetailsScreen extends StatelessWidget {
  const SellerOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: boldText(text: 'Order Details', color: darkGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // delivery status
              Visibility(
                // visible: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: 'Order Status', color: purpleColor, size: 16.0),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: 'Placed', color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'Confirmed', color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'On Delivery', color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: 'Deliverd', color: fontGrey),
                    ),
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(8))
                    .outerShadowMd
                    .white
                    .border(color: lightGrey)
                    .roundedSM
                    .make(),
              ),
              // order detail section
              Column(
                children: [
                  sellerOrderPlaced(
                    title1: "Order Code",
                    d1: "data['order_code']",
                    title2: "shipping Method",
                    d2: "data['shipping_method']",
                  ),
                  sellerOrderPlaced(
                    title1: "Order Date",
                    d1: "",
                    title2: "Payment Method",
                    d2: "data['payment_method']",
                  ),
                  sellerOrderPlaced(
                    title1: "Payment Status",
                    d1: "Unpaid",
                    title2: "Delivery Status",
                    d2: "Order Placed",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [],
                        ),
                        SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(text: "Total Amount"),
                              boldText(text: "\$400", color: red, size: 16.0)
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.border(color: lightGrey).white.make(),
              const Divider(),
              10.heightBox,
              "Ordered Product".text.size(16).color(darkGrey).makeCentered(),
              10.heightBox,
              ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(2, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sellerOrderPlaced(
                                title1: "data['orders'][index]['title']",
                                title2: "data['orders'][index]['totalPrice']",
                                d1: "{data['orders'][index]['qty']} x",
                                d2: "Refundable"),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                width: 30,
                                height: 20,
                                // color: Color(data['orders'][index]['color']),
                              ),
                            ),
                            10.heightBox,
                          ],
                        );
                      }).toList())
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              const Divider(),
              20.heightBox,
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: buttonWidget(
          color: green,
          onPress: () {},
          title: 'Confirm Order',
        ),
      ),
    );
  }
}

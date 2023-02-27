import 'package:business_empire/screen/wholesale/shop/view/order_screen/widgets/order_place.dart';
import 'package:business_empire/screen/wholesale/shop/view/order_screen/widgets/order_status.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: 'Order Details'
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              orderStatus(
                  color: redColor,
                  icon: Icons.done,
                  title: 'Order Placed',
                  showDone: data['order_placed']),
              orderStatus(
                  color: Colors.blue,
                  icon: Icons.thumb_up,
                  title: 'Order Confiremed',
                  showDone: data['order_confiremed']),
              orderStatus(
                  color: Colors.amber,
                  icon: Icons.delivery_dining,
                  title: 'Delivery',
                  showDone: data['order_on_delivery']),
              orderStatus(
                  color: Colors.green,
                  icon: Icons.done_all,
                  title: 'Delivered',
                  showDone: data['order_delivered']),
              const Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlaced(
                    title1: "Order Code",
                    d1: data['order_code'],
                    title2: "shipping Method",
                    d2: data['shipping_method'],
                  ),
                  orderPlaced(
                    title1: "Order Date",
                    d1: intl.DateFormat()
                        .add_yMd()
                        .format(data['order_date'].toDate()),
                    title2: "Payment Method",
                    d2: data['payment_method'],
                  ),
                  orderPlaced(
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
                          children: [
                            "Shipping Address".text.fontFamily(semibold).make(),
                            'Name: ${data['order_by_name']}'.text.make(),
                            'Email: ${data['order_by_email']}'.text.make(),
                            'Address: ${data['order_by_address']}'.text.make(),
                            'City: ${data['order_by_city']}'.text.make(),
                            'State: ${data['order_by_state']}'.text.make(),
                            'Phone: ${data['order_by_phone']}'.text.make(),
                            'Postal Code: ${data['order_by_postal_code']}'
                                .text
                                .make(),
                          ],
                        ),
                        SizedBox(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount".text.fontFamily(semibold).make(),
                              '${data['total_amount']}'
                                  .numCurrency
                                  .text
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.white.make(),
              const Divider(),
              10.heightBox,
              "Ordered Product"
                  .text
                  .size(16)
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .makeCentered(),
              10.heightBox,
              ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(data['orders'].length, (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderPlaced(
                                title1: data['orders'][index]['title'],
                                title2: data['orders'][index]['total_amount'],
                                d1: "${data['orders'][index]['qty']} x",
                                d2: "Refundable"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                width: 30,
                                height: 20,
                                color: Color(data['orders'][index]['color']),
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
              // Row(
              //   children: [
              //     'SUB TOTAL'
              //         .text
              //         .size(16)
              //         .fontFamily(semibold)
              //         .color(darkFontGrey)
              //         .make(),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

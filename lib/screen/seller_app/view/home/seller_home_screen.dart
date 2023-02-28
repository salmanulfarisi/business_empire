import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/appbar_widget.dart';
import 'package:business_empire/screen/seller_app/view/widgets/dashboard_button.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerHome extends StatelessWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbarWidget(dashBoard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashBoardButton(context,
                    title: products, count: '10', icon: icProducts),
                dashBoardButton(context,
                    title: orders, count: '15', icon: icOrders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dashBoardButton(context,
                    title: rating, count: '10', icon: icStar),
                dashBoardButton(context,
                    title: totalSales, count: '15', icon: icOrders),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: fontGrey, size: 16.0),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(
                  3,
                  (index) => ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          imgProduct,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                            text: 'Product Name', size: 16.0, color: fontGrey),
                        subtitle: normalText(text: "\$40.0", color: darkGrey),
                      )),
            )
          ],
        ),
      ),
    );
  }
}

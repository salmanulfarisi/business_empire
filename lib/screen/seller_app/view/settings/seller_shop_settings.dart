import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/custom_seller_textfield.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: shopSettings, size: 16.0),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            sellerTextField(label: shopName, hint: nameHint),
            10.heightBox,
            sellerTextField(label: address, hint: shopAddressHint),
            10.heightBox,
            sellerTextField(label: mobile, hint: shopMobileHint),
            10.heightBox,
            sellerTextField(label: website, hint: shopWebsiteHint),
            10.heightBox,
            sellerTextField(
                label: description, hint: shopDescHint, isDes: true),
          ],
        ),
      ),
    );
  }
}

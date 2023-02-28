import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/products/widgets/product_dropdown.dart';
import 'package:business_empire/screen/seller_app/view/products/widgets/product_images.dart';
import 'package:business_empire/screen/seller_app/view/widgets/custom_seller_textfield.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerAddNewProduct extends StatelessWidget {
  const SellerAddNewProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: 'Add product', color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: boldText(text: save, color: white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sellerTextField(hint: 'eg. BMW', label: "product name"),
              10.heightBox,
              sellerTextField(
                  hint: 'eg. Nice product', label: "Description", isDes: true),
              10.heightBox,
              sellerTextField(hint: 'eg. \$100', label: "Price"),
              10.heightBox,
              sellerTextField(hint: 'eg. 20', label: "Quantity"),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              const Divider(color: white),
              boldText(text: 'choose product images'),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => prodctsImages(label: "${index + 1}")),
              ),
              10.heightBox,
              normalText(
                  text: 'First image will be your display image',
                  color: lightGrey),
              const Divider(color: white),
              10.heightBox,
              boldText(text: 'choose product colors'),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            VxBox()
                                .color(Vx.randomPrimaryColor)
                                .roundedFull
                                .size(50, 50)
                                .make(),
                            const Icon(
                              Icons.done,
                              color: white,
                            )
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/appbar_widget.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerProducts extends StatelessWidget {
  const SellerProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: const Icon(Icons.add),
      ),
      appBar: customappbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
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
          ),
        ),
      ),
    );
  }
}

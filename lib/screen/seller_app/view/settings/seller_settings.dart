import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/settings/edit_profile.dart';
import 'package:business_empire/screen/seller_app/view/settings/seller_shop_settings.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';
import 'package:get/get.dart';

class SellerSettings extends StatelessWidget {
  const SellerSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              icon: const Icon(Icons.edit)),
          TextButton(onPressed: () {}, child: normalText(text: logout))
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(imgProduct)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(text: 'VendaorName'),
            subtitle: normalText(text: "vendor@email.com"),
          ),
          const Divider(),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                  profileButtonsIcon.length,
                  (index) => ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const ShopSettings());
                              break;
                            default:
                          }
                        },
                        leading: Icon(
                          profileButtonsIcon[index],
                          color: white,
                        ),
                        title: normalText(text: profileButtonTitle[index]),
                      )),
            ),
          )
        ],
      ),
    );
  }
}

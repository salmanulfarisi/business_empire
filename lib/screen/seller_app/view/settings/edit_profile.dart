import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/button_widget.dart';
import 'package:business_empire/screen/seller_app/view/widgets/custom_seller_textfield.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile, size: 16.0),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              imgProduct,
              width: 150,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            buttonWidget(title: changeImage, color: red, onPress: () {}),
            10.heightBox,
            const Divider(color: white),
            sellerTextField(label: name, hint: 'eg. Kunjutty'),
            10.heightBox,
            sellerTextField(label: password, hint: passwordHint),
            10.heightBox,
            sellerTextField(label: confirmPass, hint: passwordHint),
          ],
        ),
      ),
    );
  }
}

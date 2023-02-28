import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/home/seller_home.dart';
import 'package:business_empire/screen/seller_app/view/widgets/button_widget.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';
import 'package:get/get.dart';

class SellerAppLogin extends StatelessWidget {
  const SellerAppLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.heightBox,
                normalText(text: welcome, size: 18.0),
                20.heightBox,
                Row(
                  children: [
                    Image.asset(
                      icLogo,
                      width: 70,
                      height: 70,
                    )
                        .box
                        .border(color: white)
                        .rounded
                        .padding(const EdgeInsets.all(8))
                        .make(),
                    10.widthBox,
                    boldText(text: appname, size: 18.0)
                  ],
                ),
                60.heightBox,
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(email),
                        hintText: emailHint,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.email,
                          color: purpleColor,
                        ),
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(password),
                        hintText: passwordHint,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        ),
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: normalText(
                              text: forgotPassword,
                              size: 14.0,
                              color: purpleColor)),
                    ),
                    30.heightBox,
                    SizedBox(
                      width: context.screenWidth - 50,
                      child: buttonWidget(
                          title: login,
                          onPress: () {
                            Get.to(() => const SellerHomeScreen());
                          }),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .outerShadowMd
                    .padding(const EdgeInsets.all(8))
                    .make(),
                20.heightBox,
                Center(child: normalText(text: anyProblem, color: lightGrey)),
                const Spacer(),
                Center(child: boldText(text: credit)),
                20.heightBox,
              ],
            ),
          ),
        ));
  }
}

import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/messages/widgets/seller_chatbubble.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

class SellerChatScreen extends StatelessWidget {
  const SellerChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: chat, color: white, size: 16.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return sellerChatBuble();
              },
            )),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    // controller: controller.msgController,
                    decoration: const InputDecoration(
                      isDense: true,
                      hintText: "Type a message...",
                      hintStyle: TextStyle(color: darkGrey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: textfieldGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textfieldGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: white,
                    ))
              ],
            )
                .box
                .height(80)
                .padding(const EdgeInsets.all(12))
                .margin(const EdgeInsets.only(bottom: 8))
                .make()
          ],
        ),
      ),
    );
  }
}

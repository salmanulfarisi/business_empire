import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/messages/seller_chat_screen.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';
import 'package:get/get.dart';

class SellerMessagesScreen extends StatelessWidget {
  const SellerMessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0, color: white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      onTap: () {
                        Get.to(() => const SellerChatScreen());
                      },
                      leading: const CircleAvatar(
                        backgroundColor: purpleColor,
                        child: Icon(
                          Icons.person,
                          color: white,
                        ),
                      ),
                      title: boldText(text: "Username"),
                      subtitle:
                          normalText(text: 'Last msg ...', color: darkGrey),
                      trailing: normalText(text: '10:45PM', color: darkGrey),
                    )),
          ),
        ),
      ),
    );
  }
}

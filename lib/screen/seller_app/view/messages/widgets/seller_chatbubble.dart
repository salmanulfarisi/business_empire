import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

Widget sellerChatBuble() {
  // var t =
  //     data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  // var time = intl.DateFormat('h:mma').format(t);
  return Directionality(
    textDirection: TextDirection.ltr,
    // data['uid'] == currentUser!.uid ? TextDirection.rtl : TextDirection.ltr,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          normalText(text: "Your Message here...", color: fontGrey),
          10.heightBox,
          normalText(text: "10:45PM", color: darkGrey),
        ],
      ),
    ),
  );
}

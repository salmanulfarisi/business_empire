import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar customappbarWidget(title) {
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: fontGrey, size: 16.0),
    actions: [
      Center(
        child: normalText(
            text: intl.DateFormat('EEE,MMM d,' 'yy').format(DateTime.now()),
            color: darkGrey,
            size: 16.0),
      ),
      10.widthBox,
    ],
  );
}

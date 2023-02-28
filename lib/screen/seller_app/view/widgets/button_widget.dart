import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

Widget buttonWidget({title, color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      onPressed: onPress,
      child: normalText(text: title, size: 16.0));
}

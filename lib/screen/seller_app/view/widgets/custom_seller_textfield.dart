import 'package:business_empire/screen/seller_app/const/seller_const.dart';
import 'package:business_empire/screen/seller_app/view/widgets/text_style.dart';

Widget sellerTextField({label, hint, controller}) {
  return TextFormField(
    decoration: InputDecoration(
        isDense: true,
        label: normalText(text: label),
        hintText: hint,
        hintStyle: const TextStyle(color: darkGrey),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(12.0),
        //   borderSide: const BorderSide(
        //     color: white,
        //   ),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: white,
          ),
        )),
  );
}

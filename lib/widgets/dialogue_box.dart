import 'package:business_empire/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget infoDialogeBox(BuildContext context, String title, String content,
    Color color, String buttonText) {
  return CupertinoAlertDialog(
    title: Text(title, style: TextStyle(color: color)),
    content: Text(content),
    actions: [
      CupertinoDialogAction(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      CupertinoDialogAction(
        child: Text(buttonText),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}

Widget autoClickDialog(
    BuildContext context,
    String title,
    String content,
    Color color,
    String buttonText,
    double index,
    Function() onTap1,
    Function() onTap2,
    Function() onTap3) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            AppSize().height10,
            Text(content),
            AppSize().height10,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('1000 auto Clicks for \u{20B9}500'),
                    AppSize().width10,
                    GestureDetector(
                      onTap: () {
                        if (index >= 500) {
                          onTap1();
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: index >= 500 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                AppSize().height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('2000 auto Clicks for \u{20B9}600'),
                    AppSize().width10,
                    GestureDetector(
                      onTap: () {
                        if (index >= 600) {
                          onTap2();
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: index >= 600 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                AppSize().height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('3000 auto Clicks for \u{20B9}800'),
                    AppSize().width10,
                    GestureDetector(
                      onTap: () {
                        if (index >= 800) {
                          onTap3();
                        }
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: index >= 800 ? Colors.blue : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget textFormDialogue(
    BuildContext context,
    String title,
    String content,
    Color color,
    String buttonText,
    int index,
    Function() onTap,
    TextEditingController controller) {
  return AlertDialog(
    title: Text(title, style: TextStyle(color: color)),
    content: SizedBox(
      height: 100,
      child: Column(
        children: [
          Text(content),
          AppSize().height20,
          TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter amount';
              } else if (int.parse(value) >= index) {
                return 'You don\'t have enough money';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter Amount',
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        child: const Text('Cancel'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      TextButton(
        child: Text(buttonText),
        onPressed: onTap,
      ),
    ],
  );
}

import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/textformfield_widget.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditGoal extends StatelessWidget {
  final Size size;
  final TextEditingController controller;
  const EditGoal({Key? key, required this.size, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void setGoal() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble('goal', double.parse(controller.text));
      Navigator.pop(context, double.parse(controller.text));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LineIcons.piggyBank, size: 100),
            AppSize().height10,
            TextFormWidget(
              controller: controller,
              hintText: 'Enter your goal',
            ),
            const Spacer(),
            ButtonWidget(
              width: size.width,
              size: size,
              text: 'Done',
              onTap: () {
                setGoal();
              },
            ),
          ],
        ),
      ),
    );
  }
}

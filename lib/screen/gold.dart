import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/banner_container.dart';
import 'package:business_empire/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class GoldPage extends StatefulWidget {
  const GoldPage({Key? key}) : super(key: key);

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[800],
        title: const Text('Digital Gold'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Amount',
              style: AppStyle.subtitleBlack,
            ),
            AppSize().height10,
            TextFormWidget(
              controller: _controller,
            ),
            AppSize().height10,
            BannerContainer(
              amount:
                  _controller.text.isEmpty ? 0 : double.parse(_controller.text),
            )
          ],
        ),
      ),
    );
  }
}

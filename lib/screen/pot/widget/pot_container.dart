import 'package:business_empire/screen/pot/pot_add_money.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotContainer extends StatefulWidget {
  final Size size;

  const PotContainer({Key? key, required this.size}) : super(key: key);

  @override
  State<PotContainer> createState() => _PotContainerState();
}

class _PotContainerState extends State<PotContainer> {
  bool _isFirstTime = true;
  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  void _checkIfFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      setState(() {
        _isFirstTime = true;
      });
      prefs.setBool('isFirstTime', false);
    } else {
      setState(() {
        _isFirstTime = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.4,
      width: widget.size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            LineIcons.piggyBank,
            color: Colors.white,
            size: 80,
          ),
          const Text(
            'pots',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
          Container(
            width: widget.size.width * 0.4,
            height: widget.size.height * 0.04,
            padding: EdgeInsets.all(widget.size.width * 0.02),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '3.05% p.a. INTERST',
              style: AppStyle.body,
            ),
          ),
          const Text(
            'Set aside money for your daily expenses',
            textAlign: TextAlign.center,
            style: AppStyle.bodyWhite,
          ),
          ButtonWidget(
            size: widget.size,
            text: _isFirstTime ? "Start saving" : "Add money",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PotAddMoney(
                            size: widget.size,
                          )));
            },
          )
        ],
      ),
    );
  }
}

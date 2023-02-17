import 'package:business_empire/screen/pot/post_more.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class PotAdContainer extends StatelessWidget {
  final Size size;
  const PotAdContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.orange[800],
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://life.futuregenerali.in/media/fyvhebzt/how-to-save-money-from-your-monthly-salary.webp"),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Make Savings a Habit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Save money in your pot and earn interest',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                size: size,
                text: "Show me More",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PotMore(
                                size: size,
                              )));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

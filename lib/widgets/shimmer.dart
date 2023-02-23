import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExample extends StatelessWidget {
  const ShimmerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer Example'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Shimmer(
              // Replace this with your own loading widget
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('Loading'),
                subtitle: Text('Please wait...'),
              ),
              // Customize the animation duration and direction
              period: Duration(milliseconds: 800),
              direction: ShimmerDirection.ltr,
              gradient: LinearGradient(
                colors: [Colors.white, Colors.grey],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ));
        },
      ),
    );
  }
}

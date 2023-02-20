import 'package:business_empire/screen/gold/gold_repo.dart';
import 'package:business_empire/screen/pot/pot_repo.dart';
import 'package:business_empire/screen/profile/widgets/player_container.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    GoldRepo().getGold();
    PotRepo().getPotMoney();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              PlayerContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

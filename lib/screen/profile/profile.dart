import 'package:awesome_card/awesome_card.dart';
import 'package:business_empire/screen/gold/gold_repo.dart';
import 'package:business_empire/screen/pot/pot_repo.dart';
import 'package:business_empire/screen/profile/profile_repo.dart';
import 'package:business_empire/screen/profile/widgets/player_container.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/widgets/money_repository.dart';
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
    EarningsRepo().getExp();
    ProfileRepo().getUserName();
    ProfileRepo().getCardDetails();
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PlayerContainer(),
                  AppSize().height20,
                  Column(
                    children: [
                      CreditCard(
                        cardNumber: ProfileRepo.cardNumber.value,
                        cardExpiry: '12/25',
                        cardHolderName: ProfileRepo.userName.value,
                        cvv: "123",
                        bankName: 'Sample Bank',
                        showBackSide: false,
                        frontBackground: CardBackgrounds.black,
                        backBackground: CardBackgrounds.white,
                        showShadow: true,
                        // mask: getCardTypeMask(cardType: CardType.americanExpress),
                      ),
                      AppSize().height20,
                      TextButton(
                        onPressed: () {
                          ProfileRepo().generateAccnum();
                          Future.delayed(const Duration(seconds: 3), () {
                            showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                title: const Text('Account details'),
                                content: Text(
                                    'Your Auto generated account number is ${ProfileRepo.cardNumber.value}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      ProfileRepo().setcardDetails();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ok'),
                                  )
                                ],
                              ),
                            );
                          });
                        },
                        child: const Text('Generate account number'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:math' as math;

// import 'package:awesome_card/awesome_card.dart';
// import 'package:business_empire/screen/profile/profile_repo.dart';
// import 'package:flutter/material.dart';

// class CardContainer extends StatefulWidget {
//   const CardContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CardContainerState createState() => _CardContainerState();
// }

// class _CardContainerState extends State<CardContainer> {
//   late FocusNode _focusNode;
//   TextEditingController cardNumberCtrl = TextEditingController();
//   TextEditingController expiryFieldCtrl = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _focusNode.addListener(() {
//       setState(() {
//         _focusNode.hasFocus
//             ? ProfileRepo.showBack = true
//             : ProfileRepo.showBack = false;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Add Bank Account',
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 CreditCard(
//                   cardNumber: ProfileRepo.cardNumber,
//                   cardExpiry: ProfileRepo.expiryDate,
//                   cardHolderName: ProfileRepo.userName.value,
//                   cvv: ProfileRepo.cvv,
//                   bankName: 'Sample Bank',
//                   showBackSide: ProfileRepo.showBack,
//                   frontBackground: CardBackgrounds.black,
//                   backBackground: CardBackgrounds.white,
//                   showShadow: true,
//                   // mask: getCardTypeMask(cardType: CardType.americanExpress),
//                 ),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 ProfileRepo.isCardCreated
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const CardContainer()));
//                             },
//                             child: const Text('Edit Card Details'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Future.delayed(const Duration(seconds: 3), () {
//                                 setState(() {
//                                   ProfileRepo().deleteCard();
//                                   ProfileRepo().setcardDetails();
//                                   ProfileRepo.isCardCreated = false;
//                                 });
//                               });
//                             },
//                             child: const Text('Delete Card'),
//                           )
//                         ],
//                       )
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                             ),
//                             child: TextFormField(
//                               keyboardType: TextInputType.number,
//                               controller: cardNumberCtrl,
//                               decoration: const InputDecoration(
//                                   hintText: 'Card Number'),
//                               maxLength: 16,
//                               onChanged: (value) {
//                                 final newCardNumber = value.trim();
//                                 var newStr = '';
//                                 const step = 4;

//                                 for (var i = 0;
//                                     i < newCardNumber.length;
//                                     i += step) {
//                                   newStr += newCardNumber.substring(i,
//                                       math.min(i + step, newCardNumber.length));
//                                   if (i + step < newCardNumber.length) {
//                                     newStr += ' ';
//                                   }
//                                 }

//                                 setState(() {
//                                   ProfileRepo.cardNumber = newStr;
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(
//                               horizontal: 20,
//                             ),
//                             child: TextFormField(
//                               keyboardType: TextInputType.number,
//                               controller: expiryFieldCtrl,
//                               decoration: const InputDecoration(
//                                   hintText: 'Card Expiry'),
//                               maxLength: 5,
//                               onChanged: (value) {
//                                 var newDateValue = value.trim();
//                                 final isPressingBackspace =
//                                     ProfileRepo.expiryDate.length >
//                                         newDateValue.length;
//                                 final containsSlash =
//                                     newDateValue.contains('/');

//                                 if (newDateValue.length >= 2 &&
//                                     !containsSlash &&
//                                     !isPressingBackspace) {
//                                   newDateValue = newDateValue.substring(0, 2) +
//                                       '/' +
//                                       newDateValue.substring(2);
//                                 }
//                                 setState(() {
//                                   expiryFieldCtrl.text = newDateValue;
//                                   expiryFieldCtrl.selection =
//                                       TextSelection.fromPosition(TextPosition(
//                                           offset: newDateValue.length));
//                                   ProfileRepo.expiryDate = newDateValue;
//                                 });
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 20),
//                             child: TextFormField(
//                               keyboardType: TextInputType.number,
//                               decoration:
//                                   const InputDecoration(hintText: 'CVV'),
//                               maxLength: 3,
//                               onChanged: (value) {
//                                 setState(() {
//                                   ProfileRepo.cvv = value;
//                                 });
//                               },
//                               focusNode: _focusNode,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               ProfileRepo().setcardDetails();
//                               ProfileRepo.isCardCreated = true;
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Card Details Saved'),
//                                 ),
//                               );
//                             },
//                             child: const Text('Save'),
//                           )
//                           // Container(
//                           //   margin: const EdgeInsets.symmetric(
//                           //     horizontal: 20,
//                           //   ),
//                           //   child: TextFormField(
//                           //     decoration:
//                           //         const InputDecoration(hintText: 'Card Holder Name'),
//                           //     onChanged: (value) {
//                           //       setState(() {
//                           //         ProfileRepo.cardHolderName = value;
//                           //       });
//                           //     },
//                           //   ),
//                           // ),
//                         ],
//                       )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Scaffold(
//         key: _key,
//         // backgroundColor: lightGrey,
//         drawer: const CustonDrawer(),
//         body: StreamBuilder(
//           stream: FireStoreServices.getUser(currentUser!.uid),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation(redColor),
//                 ),
//               );
//             } else {
//               var data = snapshot.data!.docs[0];
//               return Stack(
//                 children: [
//                   Column(
//                     children: const [
//                       // Container(
//                       //   width: size.width,
//                       //   height: size.height * 0.35,
//                       //   color: Colors.transparent,
//                       // ),
//                     ],
//                   ),
//                   SafeArea(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               _key.currentState!.openDrawer();
//                             },
//                             icon: const Icon(
//                               LineIcons.bars,
//                               color: Colors.white,
//                             ),
//                           ),
//                           AppSize().width20,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 data['name'] == ''
//                                     ? "Hello," ""
//                                     : 'Hello,${data['name']}',
//                                 style: AppStyle.title,
//                               ),
//                               Text(
//                                 AppFunctions.greetings(greeting),
//                                 style: AppStyle.subtitle,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: size.height * 0.15,
//                     left: size.width * 0.05,
//                     child: HomeContainer(
//                       size: size,
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const BankScreen()));
//                       },
//                       upiId: data[name] == ''
//                           ? 'Add Your Name'
//                           : data['name'] + '12345@upi',
//                     ),
//                   ),
//                   Positioned(
//                     top: size.height * 0.48,
//                     left: size.width * 0.1,
//                     child: Row(
//                       children: [
//                         isVisble == true
//                             ? RoundButton(
//                                 onTap: () {
//                                   showDialog(
//                                       context: context,
//                                       builder: (context) {
//                                         return autoClickDialog(
//                                           context,
//                                           'Auto Click',
//                                           'Click on auto button to start earning',
//                                           Colors.green,
//                                           'Ok',
//                                           earnings.value,
//                                           _increamentCounterFor1000,
//                                           _increamentCounterFor2000,
//                                           _increamentCounterFor3000,
//                                         );
//                                       });
//                                 },
//                                 text: 'auto',
//                                 icon: Icons.add,
//                                 size: size,
//                               )
//                             : NonVisibleRoundButoon(
//                                 size: size,
//                                 text: 'auto',
//                                 icon: Icons.add,
//                               ),
//                         AppSize().width20,
//                         RoundButton(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PotPage(
//                                           size: size,
//                                         )));
//                           },
//                           text: 'pots',
//                           icon: Icons.add,
//                           size: size,
//                         ),
//                         AppSize().width20,
//                         RoundButton(
//                           onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => GoldPage(
//                                         size: size,
//                                       ))),
//                           text: 'Buy Gold',
//                           icon: Icons.add,
//                           size: size,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                       top: size.height * 0.60,
//                       left: size.width * 0.05,
//                       child: EarningContainer(
//                         size: size,
//                         onTap: _incrementCounter,
//                       ))
//                 ],
//               );
//             }
//           },
//         ),
//       ),
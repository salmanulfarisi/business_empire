import 'package:business_empire/screen/bank/bank_repo.dart';
import 'package:business_empire/screen/profile/profile_repo.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/screen/wholesale/widgets/bgwidget.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/style.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  bool isVisble = false;
  bool isPasswordVisble = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BankRepo().getBankAmount();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Account Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: size.width,
                height: size.height * 0.3,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.05, top: size.height * 0.02),
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        AppSize().width20,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Account Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            AppSize().height20,
                            Row(
                              children: [
                                isVisble
                                    ? ProfileRepo.cardNumber.value.isEmpty
                                        ? const Text(
                                            "000 0000 0000 0000",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        : ValueListenableBuilder(
                                            valueListenable:
                                                ProfileRepo.cardNumber,
                                            builder: (context, value, child) {
                                              return Text(
                                                value.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              );
                                            })
                                    // ValueListenableBuilder(
                                    //     valueListenable: ProfileRepo.cardNumber,
                                    //     builder: (context, value, child) {
                                    //       return Text(
                                    //         value.toString(),
                                    //         style: const TextStyle(
                                    //             color: Colors.black),
                                    //       );
                                    //     })
                                    : ProfileRepo.cardNumber.value.isEmpty
                                        ? const Text(
                                            "*******",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        : Text(
                                            ProfileRepo.cardNumber.value
                                                .replaceRange(
                                                    0, 11, "************"),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                AppSize().width20,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isVisble = !isVisble;
                                    });
                                  },
                                  child: Icon(
                                    isVisble
                                        ? Icons.remove_red_eye
                                        : Icons.remove_red_eye_outlined,
                                    color: Colors.black,
                                  ),
                                ),
                                AppSize().width20,
                                GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text: ProfileRepo.cardNumber.value));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Copied to Clipboard'),
                                    ));
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Sample Bank',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSize().height20,
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    AppSize().height10,
                    const Text("Type : Savings Account",
                        style: TextStyle(color: Colors.black)),
                    AppSize().height10,
                    const Text("Branch : Fairyland",
                        style: TextStyle(color: Colors.black)),
                    AppSize().height10,
                    const Text("IFSC : FAIRY123",
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              AppSize().height20,
              Container(
                width: size.width,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 87, 16),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Text(
                      "Balance : ",
                      style: AppStyle.subtitle,
                    ),
                    AppSize().width20,
                    isPasswordVisble
                        ? ValueListenableBuilder(
                            valueListenable: BankRepo.bankAmount,
                            builder: (context, value, child) {
                              return Text(
                                "??? " + value.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              );
                            })
                        : const Text(
                            "********",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisble = !isPasswordVisble;
                        });
                      },
                      child: const Text(
                        "Check Balance",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              AppSize().height20,
              Container(
                width: size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 87, 16),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text("Your Upi ID : ${ProfileRepo.upiId.value}",
                        style: const TextStyle(color: Colors.black)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: ProfileRepo.upiId.value));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Copied to Clipboard'),
                        ));
                      },
                      child: const Icon(
                        Icons.copy,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              AppSize().height20,
              Row(
                children: [
                  ButtonWidget(
                    size: size,
                    text: "Add Money",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AlertDialog(
                                title: const Text("Add Money"),
                                content: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _cardNumberController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Account Number";
                                          } else if (value.length != 16) {
                                            return "Enter Valid Account Number";
                                          } else if (value !=
                                              ProfileRepo.cardNumber.value) {
                                            return "Account Number Not Matched";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Account Number",
                                        ),
                                      ),
                                      AppSize().height20,
                                      TextFormField(
                                        controller: _amountController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter Amount";
                                          } else if (double.parse(value) >
                                              EarningsRepo.earnings.value) {
                                            return "Insufficient Balance";
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: "Enter Amount",
                                        ),
                                      ),
                                      AppSize().height20,
                                      ButtonWidget(
                                        size: size,
                                        text: "Add",
                                        onTap: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            BankRepo.addAmount(double.parse(
                                                _amountController.text));
                                            BankRepo().setBankAmount();
                                            EarningsRepo.decreamentEarnings(
                                                double.parse(
                                                    _amountController.text));
                                            EarningsRepo().setEarnings();
                                            EarningsRepo.increamentExpanses(
                                                double.parse(
                                                    _amountController.text));
                                            EarningsRepo().setExp();
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  AppSize().width20,
                  ButtonWidget(
                    size: size,
                    text: "Withdraw",
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

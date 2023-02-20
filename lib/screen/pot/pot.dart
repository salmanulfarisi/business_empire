import 'dart:async';
import 'dart:developer';

import 'package:business_empire/screen/pot/edit_goal.dart';
import 'package:business_empire/screen/pot/pot_repo.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:business_empire/widgets/pot_ad_container.dart';
import 'package:business_empire/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotPage extends StatefulWidget {
  final Size size;

  const PotPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<PotPage> createState() => _PotPageState();
}

class _PotPageState extends State<PotPage> {
  double setgoal = 0;
  // double addedMoney = 0;
  bool isVisible = false;
  // Timer? _timer;
  // final int _seconds = 24 * 60 * 60;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getGoalAmount();
    getPotMoney();
    // getTimer();
    // _startTimer();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  getGoalAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setgoal = prefs.getDouble('goal') ?? 0;
  }

  setPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('potMoney', PotRepo.potMoney.value);
  }

  getPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      PotRepo.potMoney.value = prefs.getDouble('potMoney') ?? 0;
      EarningsRepo.totalPotMoney.value = PotRepo.potMoney.value;
    });
  }

  getInsterestButton() {
    log("message");
    setState(() {
      isVisible = true;
    });
  }

  getInterest() {
    double interest = double.parse(
        ((PotRepo.potMoney.value * 2.25) / 100).toStringAsFixed(2));
    log(interest.toString());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Interest"),
        content: Text("You will get \u{20B9} $interest interest. \n"
            "Please check your interest after 1 day and click ok to add it to your pot."),
        actions: [
          TextButton(
            onPressed: () {
              Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  PotRepo.potMoney.value = PotRepo.potMoney.value + interest;
                  setPotMoney();
                  // _startTimer();
                  Navigator.pop(context);
                });
              });
            },
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  // void _startTimer() {
  //   const period = Duration(seconds: 1);
  //   _timer = Timer.periodic(period, (timer) {
  //     if (_seconds == 0) {
  //       _timer?.cancel();
  //       getInsterestButton();
  //       showDialog(
  //         context: context,
  //         builder: (context) => const AlertDialog(
  //           title: Text('Countdown Timer'),
  //           content: Text('Time is up!'),
  //         ),
  //       );
  //     } else {
  //       setState(() {
  //         _seconds--;
  //         setTimer();
  //       });
  //       setTimer();
  //     }
  //   });
  // }

  // setTimer() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('timer', _seconds);
  // }

  // getTimer() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _seconds = prefs.getInt('timer') ?? 24 * 60 * 60;
  // }

  // void _stopTimer() {
  //   setTimer();
  //   _timer?.cancel();
  // }

  // @override
  // void dispose() {
  //   _stopTimer();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        centerTitle: true,
        title: Column(
          children: [
            const Text('Save in Pot'),
            Text(
              'Total Savings in Pot = \u{20B9}${PotRepo.potMoney.value.toStringAsFixed(2)}',
              style: AppStyle.body,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PotAdContainer(
                size: widget.size,
              ),
              AppSize().height20,
              const Text(
                'Your Pot',
                style: AppStyle.title2,
              ),
              AppSize().height20,
              Container(
                padding: EdgeInsets.all(widget.size.width * 0.02),
                height: widget.size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Saved Money",
                      style: AppStyle.subtitleBlack,
                    ),
                    Text(
                      PotRepo.potMoney.value == 0.0
                          ? "\u{20B9} 0"
                          : "\u{20B9}${PotRepo.potMoney.value.toStringAsFixed(2)}",
                      style: AppStyle.subtitleBlack,
                    ),
                    Text(
                      setgoal == 0
                          ? "Your Goal: \u{20B9} 0"
                          : "Your Goal: \u{20B9}$setgoal",
                    ),
                    const Divider(),
                    Container(
                      width: widget.size.width * 0.4,
                      height: widget.size.height * 0.03,
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          '2.25% p.a. INTERST',
                          style: AppStyle.bodyWhite,
                        ),
                      ),
                    ),
                    const Text(
                      "Add or withdraw money from your pot",
                      style: AppStyle.subtitleBlack,
                    ),
                    const Divider(),
                    Column(
                      children: [
                        Text(
                          setgoal == 0
                              ? "0% of your goal"
                              : PotRepo.potMoney.value == 0.0
                                  ? "Don't forget to add money to your pot"
                                  : PotRepo.potMoney.value == setgoal
                                      ? "You have reached your goal"
                                      : PotRepo.potMoney.value > setgoal
                                          ? "You have exceeded your goal"
                                          : PotRepo.potMoney.value < setgoal
                                              ? "You are \u{20B9}${(setgoal - PotRepo.potMoney.value).toStringAsFixed(2)} away from your goal"
                                              : "${(PotRepo.potMoney.value / setgoal) * 100}% of your goal",
                          // : "${(addedMoney / setgoal) * 100}% of your goal",
                          // : "${(addedMoney / setgoal) * 100}% of your goal",
                        ),
                        AppSize().height10,
                        LinearProgressIndicator(
                          value: setgoal == 0
                              ? 0
                              : PotRepo.potMoney.value == 0
                                  ? 0.0
                                  : PotRepo.potMoney.value == setgoal
                                      ? 1.0
                                      : PotRepo.potMoney.value > setgoal
                                          ? 1.0
                                          : PotRepo.potMoney.value < setgoal
                                              ? PotRepo.potMoney.value / setgoal
                                              : PotRepo.potMoney.value /
                                                  setgoal,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              AlwaysStoppedAnimation(Colors.orange[800]!),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppSize().height20,
              ButtonWidget(
                width: widget.size.width * 0.2,
                size: widget.size,
                text: "Add money",
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Add Money",
                              style: TextStyle(color: Colors.black)),
                          content: SizedBox(
                            height: widget.size.height * 0.15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Add money to your pot",
                                  style: AppStyle.bodyGrey,
                                ),
                                AppSize().height20,
                                Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    controller: _controller2,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter amount';
                                      } else if (double.parse(value) >=
                                          EarningsRepo.earnings.value) {
                                        return 'You don\'t have enough money';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Amount',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: const Text("Add"),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    PotRepo.potMoney.value +=
                                        double.parse(_controller2.text);
                                    EarningsRepo.earnings.value -=
                                        double.parse(_controller2.text);
                                    setPotMoney();
                                    EarningsRepo().setEarnings();
                                    EarningsRepo.increamentExpanses(
                                        double.parse(_controller2.text));
                                    EarningsRepo().setExp();
                                    _controller2.clear();
                                  });
                                  Navigator.pop(context);
                                }
                                // Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              AppSize().height20,
              isVisible
                  ? Visibility(
                      visible: isVisible,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              getInterest();
                            },
                            child: const Text("Get Interest"),
                          ),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(LineIcons.minus),
                                          ),
                                          title: const Text('Withdraw money'),
                                          subtitle: const Text(
                                              'Withdraw money from your pot'),
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Withdraw Money",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black)),
                                                    content: SizedBox(
                                                      height:
                                                          widget.size.height *
                                                              0.15,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            "Withdraw money from your pot",
                                                            style: AppStyle
                                                                .bodyGrey,
                                                          ),
                                                          AppSize().height20,
                                                          Form(
                                                            key: _formKey,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  _controller,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please enter amount';
                                                                } else if (double
                                                                        .parse(
                                                                            value) >=
                                                                    PotRepo
                                                                        .potMoney
                                                                        .value) {
                                                                  return 'You don\'t have enough money';
                                                                }
                                                                return null;
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                hintText:
                                                                    'Enter Amount',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        child: const Text(
                                                            'Cancel'),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text(
                                                            "Withdraw"),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            setState(() {
                                                              PotRepo.potMoney
                                                                      .value -=
                                                                  int.parse(
                                                                      _controller
                                                                          .text);
                                                              EarningsRepo
                                                                      .earnings
                                                                      .value +=
                                                                  int.parse(
                                                                      _controller
                                                                          .text);
                                                              setPotMoney();
                                                              EarningsRepo()
                                                                  .setEarnings();
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          }
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                        ),
                                        ListTile(
                                          leading: const CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Icon(LineIcons.edit),
                                          ),
                                          title: const Text('Edit Your Goal'),
                                          subtitle: const Text(
                                              'Change your goal amount'),
                                          onTap: () async {
                                            setgoal = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => EditGoal(
                                                  size: widget.size,
                                                  controller: _controller,
                                                ),
                                              ),
                                            );
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: const Text("More"),
                          )
                        ],
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(LineIcons.minus),
                                    ),
                                    title: const Text('Withdraw money'),
                                    subtitle: const Text(
                                        'Withdraw money from your pot'),
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Withdraw Money",
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                              content: SizedBox(
                                                height:
                                                    widget.size.height * 0.15,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Withdraw money from your pot",
                                                      style: AppStyle.bodyGrey,
                                                    ),
                                                    AppSize().height20,
                                                    Form(
                                                      key: _formKey,
                                                      child: TextFormField(
                                                        controller: _controller,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return 'Please enter amount';
                                                          } else if (int.parse(
                                                                  value) >=
                                                              PotRepo.potMoney
                                                                  .value) {
                                                            return 'You don\'t have enough money';
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            const InputDecoration(
                                                          hintText:
                                                              'Enter Amount',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text("Withdraw"),
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      setState(() {
                                                        PotRepo.potMoney
                                                                .value -=
                                                            int.parse(
                                                                _controller
                                                                    .text);
                                                        EarningsRepo.earnings
                                                                .value +=
                                                            int.parse(
                                                                _controller
                                                                    .text);
                                                        setPotMoney();
                                                        EarningsRepo()
                                                            .setEarnings();
                                                      });
                                                      Navigator.pop(context);
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                  ListTile(
                                    leading: const CircleAvatar(
                                      backgroundColor: Colors.green,
                                      child: Icon(LineIcons.edit),
                                    ),
                                    title: const Text('Edit Your Goal'),
                                    subtitle:
                                        const Text('Change your goal amount'),
                                    onTap: () async {
                                      setgoal = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditGoal(
                                            size: widget.size,
                                            controller: _controller,
                                          ),
                                        ),
                                      );
                                      setState(() {});
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: const Text("More"),
                    ),
              // SizedBox(
              //   height: size.height * 0.4,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       return PotContainer(
              //         size: size,
              //         name: PostNameRepo.postNameList.value[index],
              //         interest: PostNameRepo.interestList[index],
              //         subtitle: PostNameRepo.subtitleList[index],
              //         index: index,
              //       );
              //     },
              //     separatorBuilder: (context, index) {
              //       return AppSize().width20;
              //     },
              //     itemCount: 3,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

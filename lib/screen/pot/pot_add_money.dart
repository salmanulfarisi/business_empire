import 'dart:async';
import 'dart:developer';

import 'package:business_empire/screen/pot/edit_goal.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PotAddMoney extends StatefulWidget {
  final Size size;

  const PotAddMoney({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<PotAddMoney> createState() => _PotAddMoneyState();
}

class _PotAddMoneyState extends State<PotAddMoney> {
  double setgoal = 0;
  double addedMoney = 0;
  bool isVisible = false;
  Timer? _timer;
  int _seconds = 24 * 60 * 60;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getGoalAmount();
    getPotMoney();
    getTimer();
    _startTimer();
  }

  getGoalAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setgoal = prefs.getDouble('goal') ?? 0;
  }

  setPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('potMoney', addedMoney);
  }

  getPotMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      addedMoney = prefs.getDouble('potMoney') ?? 0;
    });
  }

  getInsterestButton() {
    log("message");
    setState(() {
      isVisible = true;
    });
  }

  getInterest() {
    double interest =
        double.parse(((addedMoney * 3.05) / 100).toStringAsFixed(2));
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
                  addedMoney = addedMoney + interest;
                  _startTimer();
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

  void _startTimer() {
    const period = Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      if (_seconds == 0) {
        _timer?.cancel();
        getInsterestButton();
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Countdown Timer'),
            content: Text('Time is up!'),
          ),
        );
      } else {
        setState(() {
          _seconds--;
          setTimer();
        });
        setTimer();
      }
    });
  }

  setTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('timer', _seconds);
  }

  getTimer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seconds = prefs.getInt('timer') ?? 24 * 60 * 60;
  }

  void _stopTimer() {
    setTimer();
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              LineIcons.piggyBank,
              size: 100,
            ),
            AppSize().height10,
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
                    "Money Saved",
                    style: AppStyle.subtitleBlack,
                  ),
                  Text(
                    "\u{20B9} $addedMoney",
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
                        '3.05% p.a. INTERST',
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
                            : addedMoney == 0.0
                                ? "Don't forget to add money to your pot"
                                : addedMoney == setgoal
                                    ? "You have reached your goal"
                                    : addedMoney > setgoal
                                        ? "You have exceeded your goal"
                                        : addedMoney < setgoal
                                            ? "You are \u{20B9}${setgoal - addedMoney} away from your goal"
                                            : "${(addedMoney / setgoal) * 100}% of your goal",
                        // : "${(addedMoney / setgoal) * 100}% of your goal",
                        // : "${(addedMoney / setgoal) * 100}% of your goal",
                      ),
                      AppSize().height10,
                      LinearProgressIndicator(
                        value: setgoal == 0
                            ? 0
                            : addedMoney == 0
                                ? 0.0
                                : addedMoney == setgoal
                                    ? 1.0
                                    : addedMoney > setgoal
                                        ? 1.0
                                        : addedMoney < setgoal
                                            ? addedMoney / setgoal
                                            : addedMoney / setgoal,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation(Colors.orange[800]!),
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
                                    } else if (int.parse(value) >=
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
                                  addedMoney += double.parse(_controller2.text);
                                  EarningsRepo.earnings.value -=
                                      int.parse(_controller2.text);
                                  setPotMoney();
                                  EarningsRepo().setEarnings();
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
                                                          color: Colors.black)),
                                                  content: SizedBox(
                                                    height: widget.size.height *
                                                        0.15,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Withdraw money from your pot",
                                                          style:
                                                              AppStyle.bodyGrey,
                                                        ),
                                                        AppSize().height20,
                                                        Form(
                                                          key: _formKey,
                                                          child: TextFormField(
                                                            controller:
                                                                _controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return 'Please enter amount';
                                                              } else if (double
                                                                      .parse(
                                                                          value) >=
                                                                  addedMoney) {
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
                                                      child:
                                                          const Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.pop(context);
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
                                                            addedMoney -=
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
                                          Navigator.pop(context);
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
                                            title: const Text("Withdraw Money",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            content: SizedBox(
                                              height: widget.size.height * 0.15,
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
                                                          TextInputType.number,
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return 'Please enter amount';
                                                        } else if (int.parse(
                                                                value) >=
                                                            addedMoney) {
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
                                                      addedMoney -= int.parse(
                                                          _controller.text);
                                                      EarningsRepo
                                                              .earnings.value +=
                                                          int.parse(
                                                              _controller.text);
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
            AppSize().height20,
            const Text("Wait for Next Interest"),
            Text(
              '${_seconds ~/ 3600} hours, ${(_seconds % 3600) ~/ 60} minutes, ${_seconds % 60} seconds',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

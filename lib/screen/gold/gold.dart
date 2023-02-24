import 'package:business_empire/screen/gold/gold_repo.dart';
import 'package:business_empire/screen/gold/widget/gold_container.dart';
import 'package:business_empire/screen/wholesale/shop/widgets/consts.dart';
import 'package:business_empire/utils/utils.dart';
import 'package:business_empire/widgets/banner_container.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:business_empire/widgets/money_repository.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GoldPage extends StatefulWidget {
  final Size size;
  const GoldPage({Key? key, required this.size}) : super(key: key);

  @override
  State<GoldPage> createState() => _GoldPageState();
}

class _GoldPageState extends State<GoldPage> {
  bool isloading = false;
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double goldRate = 0.00;
  double currentPrice = 5813.00;
  @override
  void initState() {
    super.initState();
    GoldRepo().getGold();
    loadImage();
  }

  Future<void> loadImage() async {
    setState(() {
      isloading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String getGm =
        (GoldRepo.gold.value / currentPrice).toStringAsFixed(4).toString();
    getGoldRate(double goldRate) {
      setState(() {
        goldRate =
            _controller.text.isEmpty ? 0 : double.parse(_controller.text);
      });
      return goldRate;
    }

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: redColor,
        title: Column(
          children: [
            const Text('Digital Gold'),
            ValueListenableBuilder(
              valueListenable: GoldRepo.totalGold,
              builder: (context, double value, child) {
                return Text(
                  'You have ${value.toStringAsFixed(4)} gm of gold',
                  style: AppStyle.bodyWhite,
                );
              },
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
              isloading
                  ? Shimmer.fromColors(
                      child: Container(
                        height: widget.size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                    )
                  : const GoldContainer(),
              AppSize().height10,
              const Text(
                'Enter Amount',
                style: AppStyle.subtitleBlack,
              ),
              AppSize().height10,
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Amount';
                    } else if (double.parse(value) >
                        EarningsRepo.earnings.value) {
                      return 'You don\'t have enough money';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Amount',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.currency_rupee_rounded,
                      color: Colors.black,
                    ),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      GoldRepo.gold.value = double.parse(value);
                      // goldRate = double.parse(value);
                    });
                  },
                ),
              ),
              AppSize().height10,
              BannerContainer(
                amount: getGoldRate(goldRate),
                getGm: double.parse(getGm),
              ),
              AppSize().height20,
              Center(
                child: ButtonWidget(
                  size: widget.size,
                  text: 'Buy Now',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Buy Gold'),
                          content: Text(
                            'You have bought $getGm gm of gold for \u{20B9}$goldRate',
                            style: AppStyle.bodyGrey,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  GoldRepo.increamentGold(double.parse(getGm));
                                  EarningsRepo.decreamentEarnings(
                                      double.parse(_controller.text));
                                  EarningsRepo().setEarnings();
                                  GoldRepo().setGold();
                                  EarningsRepo.increamentExpanses(
                                      double.parse(_controller.text));
                                  EarningsRepo().setExp();
                                  _controller.clear();
                                });

                                Navigator.pop(context);
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

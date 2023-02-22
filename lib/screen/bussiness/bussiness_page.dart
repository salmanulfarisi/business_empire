import 'package:business_empire/model/new_shop.dart';
import 'package:business_empire/screen/bussiness/current_shop.dart';
import 'package:business_empire/screen/bussiness/widgets/bussiness_container.dart';
import 'package:business_empire/screen/bussiness/widgets/my_bussinesses_card.dart';
import 'package:business_empire/screen/bussiness/widgets/offline_business.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/style.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class BussinessPage extends StatefulWidget {
  const BussinessPage({Key? key}) : super(key: key);

  @override
  State<BussinessPage> createState() => _BussinessPageState();
}

class _BussinessPageState extends State<BussinessPage> {
  @override
  void initState() {
    super.initState();
    newShop = [];
    print(newShop.length);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Bussiness Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const BussinessContainer(),
            AppSize().height20,
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    size: size,
                    text: "offline bussiness",
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Offline()));
                      setState(() {});
                      print(newShop.length);
                    },
                  ),
                ),
                AppSize().width10,
                Expanded(
                  child: ButtonWidget(
                    size: size,
                    text: "online bussiness",
                  ),
                ),
              ],
            ),
            AppSize().height20,
            const Text(
              "My Bussiness",
              style: AppStyle.title2,
            ),
            AppSize().height20,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => newShop.isEmpty
                  ? GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Offline()));
                        setState(() {});
                      },
                      child: MyBussinessess(
                        size: size,
                        shopImage:
                            "https://images.unsplash.com/photo-1599991271439-cdcfc90096cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                        shopName: "Unknown Shop",
                        shopType: "Add your shop",
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        print(newShop[index].name);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CurrentShop(
                                      title: newShop[index].name,
                                      shopImage: newShop[index].image,
                                    )));
                      },
                      child: MyBussinessess(
                        size: size,
                        shopImage: newShop[index].image,
                        shopName: newShop[index].name,
                        shopType: newShop[index].type,
                      ),
                    ),
              separatorBuilder: (context, index) => AppSize().height20,
              itemCount: newShop.isEmpty ? 1 : newShop.length,
            )
          ],
        ),
      ),
    );
  }
}

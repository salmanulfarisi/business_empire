import 'package:business_empire/services/add_shop.dart';
import 'package:business_empire/utils/size.dart';
import 'package:business_empire/utils/style.dart';
import 'package:business_empire/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ShopAdd extends StatefulWidget {
  final String shopImage;
  final String title;
  final double price;
  final int? index;
  const ShopAdd(
      {Key? key,
      required this.title,
      required this.price,
      this.index,
      required this.shopImage})
      : super(key: key);

  @override
  State<ShopAdd> createState() => _ShopAddState();
}

class _ShopAddState extends State<ShopAdd> {
  final TextEditingController _shopName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[800],
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.55,
                child: Text("Give a name to your ${widget.title}",
                    style: AppStyle.title2),
              ),
              AppSize().height20,
              TextFormField(
                controller: _shopName,
                decoration: const InputDecoration(
                    hintText: "Enter your shop name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              AppSize().height20,
              SizedBox(
                width: size.width * 0.55,
                child: Text("cost of your ${widget.title} is ₹${widget.price}",
                    style: AppStyle.subtitleBlack),
              ),
              AppSize().height20,
              ButtonWidget(
                width: size.width * 0.55,
                height: size.height * 0.0001,
                size: size,
                text: "Strat your ${widget.title}",
                onTap: () async {
                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      AddshopService().addShopData(
                        _shopName.text,
                        widget.title,
                        widget.shopImage,
                      );
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Shop Added'),
                      ),
                    );
                  });
                },
              )
            ],
          ),
        ));
  }
}

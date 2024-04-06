import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/appbar.dart';
import 'package:woocom_3_16_9/Components/cart_checkout.dart';
import 'package:woocom_3_16_9/Routes/routes.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'dart:core';

class CartAdvanceScreen extends StatefulWidget {
  @override
  _CartAdvanceScreenState createState() => _CartAdvanceScreenState();
}

class _CartAdvanceScreenState extends State<CartAdvanceScreen> {
  List<Cart>? cartListData = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      cartListData!.add(Cart(productItem: 1, productPrice: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Product Cart'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Divider(thickness: 0.8),
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _CartItem(
                        productImg: AppIcon.bagImg6,
                        title: 'Travelling Bag',
                        totalItem: cartListData![index].productItem.toString(),
                        price: "\$${cartListData![index].productPrice}",
                        onTapAdd: () {
                          setState(() {
                            cartListData![index].productItem =
                                cartListData![index].productItem! + 1;
                            cartListData![index].productPrice =
                                cartListData![index].productPrice! + 100;
                          });
                        },
                        onTapRemove: () {
                          setState(() {
                            if (cartListData![index].productItem! > 1) {
                              cartListData![index].productItem =
                                  cartListData![index].productItem! - 1;
                              cartListData![index].productPrice =
                                  cartListData![index].productPrice! - 100;
                            }
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(height: h * 0.01),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRow("Subtotal", "${getSubTotal()}\$"),
                      SizedBox(height: h * 0.01),
                      buildRow("Discount", "${discount()}\$"),
                      SizedBox(height: h * 0.01),
                      buildRow("Taxes", "${tax()}\$"),
                      SizedBox(height: h * 0.03),
                      ApplyCoupen(
                        fill: true,
                        fillColor: greyLight5.withOpacity(0.3),
                        textFieldHint: "Enter coupon",
                        coupedSubmitLable: "Apply",
                        applyOnTap: () {
                          print("ON TAP APPLY");
                        },
                      ),
                      SizedBox(height: h * 0.13),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CartCheckOutWidget(
            checkOutPrice: "\$${checkOut()}",
            submitButtonLable: "Checkout",
            checkOutOnTap: () {
              Navigator.pushNamed(context, PageRoutes.checkOutAddressScreen);
            },
          ),
        ],
      ),
    );
  }


  int getSubTotal(){
    int val = cartListData!.fold(0, (p, element) => int.parse(p.toString()) + element.productPrice!);
    return val;
  }

  int discount(){
    int? dis = ((getSubTotal() * 5) / 100).floor();
    return dis;
  }

  int tax(){
    int taxes = ((getSubTotal() * 1) / 100).floor();
    return taxes;
  }

  int checkOut(){
    int checkout = ((getSubTotal() - discount()) + tax()).floor();
    return checkout;
  }

}

class _CartItem extends StatelessWidget {
  String title, totalItem, price, productImg;
  void Function()? onTapAdd, onTapRemove;

  _CartItem({
    Key? key,
    required this.title,
    required this.totalItem,
    required this.onTapAdd,
    required this.onTapRemove,
    required this.price,
    required this.productImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(
                    color: lightBlue,
                  ),
                ),
                height: h * 0.1,
                width: w * 0.22,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset(
                    productImg,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  // color: red.withOpacity(0.2),
                  padding: EdgeInsets.only(left: w * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Travelling Bag",
                        style: TextStyle(
                          fontFamily: futuraMediumBt,
                          fontSize: 17,
                          color: black,
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onTapAdd,
                            child: Image.asset(
                              AppIcon.plus,
                              height: h * 0.022,
                            ),
                          ),
                          SizedBox(width: w * 0.02),
                          Container(
                            height: h * 0.022,
                            width: w * 0.045,
                            decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                totalItem,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: futuraMediumBt,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: w * 0.02),
                          GestureDetector(
                            onTap: onTapRemove,
                            child: Image.asset(
                              AppIcon.minus,
                              height: h * 0.022,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                              color: lightBlue,
                              fontSize: 15,
                              fontFamily: futuraHeavyFont,
                            ),
                          ),
                          Container(
                            height: h * 0.02,
                            child: Image.asset(
                              AppIcon.iconDelete,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: h * 0.01),
          // index == 10 - 1 ? SizedBox() : Divider(thickness: 0.8),
          // Divider(thickness: 0.8),
          // SizedBox(height: h * 0.01),
        ],
      ),
    );
  }
}

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.productItem,
    this.productPrice,
  });

  int? productItem, productPrice;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productItem: json["productItem"],
        productPrice: json["productPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productItem": productItem,
        "productPrice": productPrice,
      };
}

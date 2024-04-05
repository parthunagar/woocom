import 'package:flutter/material.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Components/custom_listview.dart';
import 'dart:core';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';

class OrderListScreen extends StatefulWidget {
  // const OrderListScreen({Key key}) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  // TODO: VARIABLE

  // Show Divider
  late int cartItem = 1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Orders'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              // CustomListViewWidget(
              //   title: "Travelling Bag",
              //   actualPrice: "\$100",
              //   totalPrice: "\$200",
              //   showDeleteIcon: false,
              //   onTapDelete: () {
              //     setState(() {
              //       print("TAP ON DELETE");
              //     });
              //   },
              //   onTapItem: () {
              //     setState(() {
              //       print("TAP ON ITEM");
              //     });
              //   },
              // )
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(top: h * 0.03),
                    color: white,
                    // elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04,
                        vertical: h * 0.015,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Order Id:',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: lightBlue,
                                    fontFamily: futuraHeavyFont,
                                  ),
                                ),
                                TextSpan(
                                  text: '#35215231',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: greyDark,
                                    fontFamily: futuraBookFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: h * 0.02),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Container(
                                // padding: EdgeInsets.symmetric( horizontal: w * 0.04, vertical: h * 0.01),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                              color: lightBlue,
                                            ),
                                          ),
                                          height: h * 0.1,
                                          width: w * 0.2,
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Image.asset(
                                              AppIcon.bagImg6,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(left: w * 0.04),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Travelling Bag",
                                                  style: TextStyle(
                                                    fontFamily: futuraMediumBt,
                                                    fontSize: 17,
                                                    color: black,
                                                    // fontWeight: FontWeight.bold
                                                  ),
                                                ),
                                                SizedBox(height: h * 0.01),
                                                Text(
                                                  "\$100",
                                                  style: TextStyle(
                                                    color: lightBlue,
                                                    fontSize: 15,
                                                    fontFamily: futuraHeavyFont,
                                                    // fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                SizedBox(height: h * 0.01),
                                                Text(
                                                  "\$200",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: darkBlue,
                                                    fontSize: 15,
                                                    fontFamily: futuraLightBt,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: h * 0.01),
                                    index == 2 - 1
                                        ? SizedBox()
                                        : Divider(thickness: 0.8),
                                    SizedBox(height: h * 0.01),
                                  ],
                                ),
                              );
                            },
                          ),
                          // SizedBox(height: h * 0.005),
                          Center(
                            child: CustomButton(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.01),
                              label: "Cancel Order",
                              lableSize: 16,
                              width: w * 0.35,
                              height: h * 0.045,
                              fontWeight: FontWeight.normal,
                              onTap: () {
                                setState(() {
                                  print("cancel Order");
                                });
                              },
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/appbar.dart';
import 'package:woocom_3_16_9/Components/custom_listview.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'dart:core';

import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class WishListScreen extends StatefulWidget {
  // const WishListScreen({Key key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  // TODO: VARIABLE
  // Show Divider
  late int cartItem = 1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Whishlist'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              SizedBox(height: h * 0.02),
              CustomListViewWidget(
                title: "Travelling Bag",
                actualPrice: "\$100",
                totalPrice: "\$200",
                showDeleteIcon: true,
                onTapDelete: () {
                  setState(() {
                    print("TAP ON DELETE");
                  });
                },
                onTapItem: () {
                  setState(() {
                    print("TAP ON ITEM");
                  });
                },
              ),
              // ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         child: Column(
              //           children: [
              //             Row(
              //               children: [
              //                 Container(
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(7),
              //                       border: Border.all(color: lightBlue)),
              //                   height: h * 0.1,
              //                   width: w * 0.2,
              //                   child: Padding(
              //                     padding: EdgeInsets.all(4.0),
              //                     child: Image.asset(
              //                       bag6,
              //                       fit: BoxFit.contain,
              //                     ),
              //                   ),
              //                 ),
              //                 Flexible(
              //                   child: Container(
              //                     padding: EdgeInsets.only(left: w * 0.04),
              //                     child: Column(
              //                       crossAxisAlignment:
              //                           CrossAxisAlignment.start,
              //                       mainAxisAlignment: MainAxisAlignment.center,
              //                       children: [
              //                         Text(
              //                           "Travelling Bag",
              //                           style: TextStyle(
              //                             fontFamily: futuraMediumBt,
              //                             fontSize: 17,
              //                             color: black,
              //                             // fontWeight: FontWeight.bold
              //                           ),
              //                         ),
              //                         SizedBox(height: h * 0.01),
              //                         Text(
              //                           "\$100",
              //                           style: TextStyle(
              //                             color: lightBlue,
              //                             fontSize: 15,
              //                             fontFamily: futuraHeavyFont,
              //                             // fontWeight: FontWeight.w600
              //                           ),
              //                         ),
              //                         SizedBox(height: h * 0.01),
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Text(
              //                               "\$200",
              //                               style: TextStyle(
              //                                   decoration:
              //                                       TextDecoration.lineThrough,
              //                                   color: darkBlue,
              //                                   fontSize: 15,
              //                                   fontFamily: futuraLightBt),
              //                             ),
              //                             Container(
              //                               height: h * 0.02,
              //                               child: Image.asset(
              //                                 iconDelete,
              //                               ),
              //                             )
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(height: h * 0.01),
              //             index == 10 - 1
              //                 ? SizedBox()
              //                 : Divider(thickness: 0.8),
              //             SizedBox(height: h * 0.01),
              //           ],
              //         ),
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

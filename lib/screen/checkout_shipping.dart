import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/Routes/routes.dart';

class CheckOutShippingScreen extends StatefulWidget {
  @override
  _CheckOutShippingScreenState createState() => _CheckOutShippingScreenState();
}

class _CheckOutShippingScreenState extends State<CheckOutShippingScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                children: [
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcon.place1,
                        height: h * 0.07,
                      ),
                      DottedLine(
                        lineLength: w * 0.22,
                        direction: Axis.horizontal,
                        dashLength: 2,
                        dashGapLength: 3.2,
                        dashColor: black,
                      ),
                      Image.asset(
                        AppIcon.shipping1,
                        height: h * 0.07,
                      ),
                      DottedLine(
                        lineLength: w * 0.22,
                        direction: Axis.horizontal,
                        dashLength: 2,
                        dashGapLength: 3.2,
                        dashColor: black,
                      ),
                      Image.asset(
                        AppIcon.payment,
                        height: h * 0.07,
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.014),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                            color: greyDark,
                            fontSize: 17,
                            fontFamily: futuraMediumBt,
                          ),
                        ),
                        Text(
                          "Shipping",
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 17,
                            fontFamily: futuraHeavyFont,
                          ),
                        ),
                        Text(
                          "Payment",
                          style: TextStyle(
                            color: greyDark,
                            fontSize: 17,
                            fontFamily: futuraMediumBt,
                          ),
                        )
                      ]),
                  SizedBox(height: h * 0.1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                    child: Text(
                      "Shipping not available for now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: futuraBookFont,
                        color: greyDark,
                        fontSize: 29,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  label: "Go to Payment",
                  lableSize: 19,
                  width: w * 0.55,
                  height: h * 0.06,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    Navigator.pushNamed(
                        context, PageRoutes.checkOutPaymentScreen);
                  },
                ),
                SizedBox(height: h * 0.02)
              ],
            ),
            // ),
          ),
        ],
      ),
    );
  }
}

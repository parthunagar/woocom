import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';

class CheckOutPaymentScreen extends StatefulWidget {
  @override
  _CheckOutPaymentScreenState createState() => _CheckOutPaymentScreenState();
}

class _CheckOutPaymentScreenState extends State<CheckOutPaymentScreen> {
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
                        AppIcon.shipping,
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
                        AppIcon.payment1,
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
                          color: greyDark,
                          fontSize: 17,
                          fontFamily: futuraMediumBt,
                        ),
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(
                          color: darkBlue,
                          fontSize: 17,
                          fontFamily: futuraHeavyFont,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.04),
                  Text(
                    "Make order easy for your selected products with a straightforward, Click on submit order to continue payment abs order delivery to your personal addresda.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: futuraBookFont,
                      color: black,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              height: h * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$200",
                    style: TextStyle(
                      color: yellow,
                      fontSize: 33,
                      fontFamily: futuraHeavyFont,
                    ),
                  ),
                  CustomButton(
                    label: "Pay via paypal",
                    lableSize: 19,
                    width: w * 0.55,
                    height: h * 0.06,
                    fontWeight: FontWeight.normal,
                    onTap: () {
                      Navigator.pushNamed(
                          context, PageRoutes.orderPlacedScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

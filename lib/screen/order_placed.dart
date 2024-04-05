import 'package:flutter/material.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';

class OrderPlacedScreen extends StatefulWidget {
  // const OrderPlacedScreen({Key key}) : super(key: key);

  @override
  _OrderPlacedScreenState createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppIcon.orderPlaced,
            height: h,
            width: w,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: h * 0.03,
                right: w * 0.05,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  AppIcon.close,
                  height: h * 0.018,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcon.checkMark,
                  height: h * 0.06,
                ),
                SizedBox(height: h * 0.035),
                Text(
                  "ORDER PLACED",
                  style: TextStyle(
                    color: white,
                    fontSize: 25,
                    fontFamily: unicodeFuturab,
                  ),
                ),
                SizedBox(height: h * 0.035),
                Container(
                  height: h * 0.1,
                  width: w * 0.75,
                  padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: lightBlueOpacity,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Expected delivery",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: greyLight4.withOpacity(0.5),
                            fontSize: 16,
                            fontFamily: unicodeFuturab,
                          ),
                        ),
                      ),
                      Text(
                        "10 DEC",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: white,
                          fontSize: 16,
                          fontFamily: unicodeFuturab,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

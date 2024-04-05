import 'package:flutter/material.dart';
import 'package:woocom/Components/cart_checkout.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int cartItem = 1;
  late int _id = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
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
                                    padding: EdgeInsets.only(left: w * 0.04),
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
                                          ),
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  cartItem++;
                                                  _id = index;
                                                });
                                              },
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  _id == index
                                                      ? cartItem.toString()
                                                      : _id.toString(),
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily: futuraMediumBt,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: w * 0.02),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _id = index;
                                                  if (cartItem > 1) {
                                                    cartItem--;
                                                  }
                                                });
                                              },
                                              child: Image.asset(
                                                AppIcon.minus,
                                                height: h * 0.022,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: h * 0.01),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$100",
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
                            SizedBox(height: h * 0.01),
                            index == 10 - 1
                                ? SizedBox()
                                : Divider(thickness: 0.8),
                            SizedBox(height: h * 0.01),
                          ],
                        ),
                      );
                    }),
                SizedBox(height: h * 0.01),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildRow("Subtotal", "120\$"),
                    SizedBox(height: h * 0.01),
                    buildRow("Discount", "0\$"),
                    SizedBox(height: h * 0.01),
                    buildRow("Taxes", "20\$"),
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
          checkOutPrice: "\$200",
          submitButtonLable: "Checkout",
          checkOutOnTap: () {
            Navigator.pushNamed(context, PageRoutes.checkOutAddressScreen);
          },
          // subTotalTitle: "Subtotal",
          // subTotalAmount: "120\$",
          // discountTitle: "Discount",
          // discountAmount: "0\$",
          // taxesTitle: "Taxes",
          // taxesAmount: "20\$",
          // textFieldHint: "Enter coupon",
          // coupedSubmitLable: "Apply",
          // fillColor: greyLight5.withOpacity(0.3),
          // fill: true,
          // applyOnTap: () {  print("TAP ON Apply "); },
        )
      ],
    );
  }
}

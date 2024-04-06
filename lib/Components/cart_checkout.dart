import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/commonwidget.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class ApplyCoupen extends StatefulWidget {
  String? textFieldHint;
  String? coupedSubmitLable;
  final applyOnTap;
  bool? fill;
  Color? fillColor;

  ApplyCoupen({
    this.applyOnTap,
    this.textFieldHint,
    this.coupedSubmitLable,
    this.fillColor,
    this.fill,
  });

  @override
  _ApplyCoupenState createState() => _ApplyCoupenState();
}

class _ApplyCoupenState extends State<ApplyCoupen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: h * 0.015),
              filled: widget.fill,
              fillColor: widget.fillColor,
              border: InputBorder.none,
              hintText: widget.textFieldHint ?? "",
              alignLabelWithHint: true,
              hintStyle: TextStyle(
                fontFamily: futuraBookFont,
                fontWeight: FontWeight.w500,
              ),
            ),
            // decoration: const InputDecoration(helperText: "Enter App ID"),
            // style: Theme.of(context).textTheme.body1,
          ),
        ),
        SizedBox(width: w * 0.04),
        CustomButton(
          label: widget.coupedSubmitLable ?? "",
          lableSize: 18,
          height: h * 0.048,
          textColor: lightBlue,
          fontWeight: FontWeight.normal,
          padding: EdgeInsets.symmetric(horizontal: 0),
          color: white,
          borderColor: yellow,
          width: w * 0.25,
          onTap: widget.applyOnTap ?? () {},
        ),
      ],
    );
  }
}

class CartCheckOutWidget extends StatefulWidget {
  String? subTotalTitle;
  String? subTotalAmount;
  String? discountTitle;
  String? discountAmount;
  String? taxesTitle;
  String? taxesAmount;
  String? checkOutPrice;
  String? textFieldHint;
  String? coupedSubmitLable;
  final applyOnTap;
  final checkOutOnTap;
  String? submitButtonLable;
  bool? fill;
  Color? fillColor;

  CartCheckOutWidget({
    this.subTotalTitle,
    this.subTotalAmount,
    this.discountTitle,
    this.discountAmount,
    this.taxesTitle,
    this.taxesAmount,
    this.applyOnTap,
    this.checkOutPrice,
    this.checkOutOnTap,
    this.textFieldHint,
    this.coupedSubmitLable,
    this.submitButtonLable,
    this.fillColor,
    this.fill,
  });

  @override
  _CartCheckOutWidgetState createState() => _CartCheckOutWidgetState();
}

class _CartCheckOutWidgetState extends State<CartCheckOutWidget> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        height: h * 0.09,
        color: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.checkOutPrice ?? "",
                  style: TextStyle(
                    color: yellow,
                    fontSize: 33,
                    fontFamily: futuraHeavyFont,
                  ),
                ),
                CustomButton(
                  label: widget.submitButtonLable ?? "",
                  lableSize: 19,
                  width: w * 0.55,
                  height: h * 0.06,
                  fontWeight: FontWeight.normal,
                  onTap: widget.checkOutOnTap ?? () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildRow(String title, String amount) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          color: black,
          fontSize: 19,
          fontFamily: futuraMediumBt,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        amount,
        style: TextStyle(
          color: black,
          fontSize: 19,
          fontFamily: futuraMediumBt,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

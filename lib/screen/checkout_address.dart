import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Components/emtryfield.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/Validator/validator.dart';
import 'package:woocom/const/constant.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';
import 'dart:async';
import 'package:woocom/utils/toast_utils.dart';

class CheckOutAddressScreen extends StatefulWidget {
  @override
  _CheckOutAddressScreenState createState() => _CheckOutAddressScreenState();
}

class _CheckOutAddressScreenState extends State<CheckOutAddressScreen> {
  //TODO: Variable CheckOutAddressScreen
  //  TextField Controller
  TextEditingController firstNmeC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController companyC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  bool showProgress = false;

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
                        AppIcon.place,
                        height: h * 0.07,
                      ),
                      DottedLine(
                          lineLength: w * 0.22,
                          direction: Axis.horizontal,
                          dashLength: 2,
                          dashGapLength: 3.2,
                          dashColor: black),
                      Image.asset(
                        AppIcon.shipping,
                        height: h * 0.07,
                      ),
                      DottedLine(
                          lineLength: w * 0.22,
                          direction: Axis.horizontal,
                          dashLength: 2,
                          dashGapLength: 3.2,
                          dashColor: black),
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
                          color: darkBlue,
                          fontSize: 17,
                          fontFamily: futuraHeavyFont,
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
                          color: greyDark,
                          fontSize: 17,
                          fontFamily: futuraMediumBt,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.025),
                  EntryField(
                    label: "First Name",
                    controller: firstNmeC,
                    keyboardType: TextInputType.name,
                  ),
                  EntryField(
                    label: "Last Name",
                    controller: lastNameC,
                    keyboardType: TextInputType.name,
                  ),
                  EntryField(
                    label: "Email",
                    controller: emailC,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  EntryField(
                    label: "Company",
                    controller: companyC,
                    keyboardType: TextInputType.name,
                  ),
                  EntryField(
                    label: "Address",
                    controller: addressC,
                    keyboardType: TextInputType.streetAddress,
                    maxLines: 2,
                    minLines: 2,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.location_on,
                        color: greyLight4,
                        size: h * 0.04,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxHeight: h * 0.05,
                      maxWidth: w * 0.1,
                    ),
                  ),
                  EntryField(
                    label: "Phone",
                    controller: phoneC,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  SizedBox(height: h * 0.06),
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
                  label: "Save",
                  lableSize: 19,
                  width: w * 0.55,
                  height: h * 0.06,
                  fontWeight: FontWeight.normal,
                  onTap: () {
                    print('sasas');
                    setState(() {
                      save();
                    });
                  },
                ),
                SizedBox(height: h * 0.02)
              ],
            ),
          ),
        ],
      ),
    );
  }

  //TODO: Method CheckOutAddressScreen
  save() {
    RegExp regexEmail = new RegExp(emailPattern);
    RegExp regexName = new RegExp(namePattern);
    setState(() {
      showProgress = true;
    });
    if (firstNmeC.text.isEmpty) {
      ToastUtils().showToast("First name is required.");
    } else if (lastNameC.text.isEmpty) {
      ToastUtils().showToast("Last name is required.");
    } else if (emailC.text.isEmpty) {
      ToastUtils().showToast("Email is required.");
    } else if (companyC.text.isEmpty) {
      ToastUtils().showToast("Company name is required.");
    } else if (addressC.text.isEmpty) {
      ToastUtils().showToast("Address is required.");
    } else if (phoneC.text.isEmpty) {
      ToastUtils().showToast("Phone number is required.");
    } else if (phoneC.text.length < 10) {
      ToastUtils().showToast("Phone number length must be 10 digits.");
    } else if (!regexEmail.hasMatch(emailC.text.toString())) {
      ToastUtils().showToast("Please enter a valid email address.");
    } else if (!regexName.hasMatch(firstNmeC.text.toString())) {
      ToastUtils().showToast("Numeric value not allowed in First name.");
    } else if (!regexName.hasMatch(lastNameC.text.toString())) {
      ToastUtils().showToast("Numeric value not allowed in Last name.");
    } else {
      Navigator.pushNamed(context, PageRoutes.checkOutShippingScreen);
    }
  }
}

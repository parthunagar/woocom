import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/screen/dashBoard.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(AppIcon.shape),
                  Container(
                    margin: EdgeInsets.only(top: h * 0.1, left: w * 0.05),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontSize: h * 0.037,
                                    color: white,
                                    fontFamily: futuraBookFont,
                                  ),
                        ),
                        SizedBox(height: h * 0.01),
                        Text(
                          "Sign Up!",
                          style: TextStyle(
                            fontSize: h * 0.07, //53,
                            fontWeight: FontWeight.w500,
                            color: yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                child: Center(
                  child: Column(
                    children: [
                      _loginButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return DashBoardScreen();
                          }), (Route<dynamic> route) => false);
                        },
                        title: "Sign in with Google",
                        icon: AppIcon.google,
                      ),
                      SizedBox(height: h * 0.05),
                      _loginButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return DashBoardScreen();
                          }), (Route<dynamic> route) => false);
                        },
                        title: "Sign in with FaceBook",
                        icon: AppIcon.facebook,
                      ),
                      SizedBox(height: h * 0.05),
                      _loginButton(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) {
                            return DashBoardScreen();
                          }), (Route<dynamic> route) => false);
                        },
                        title: "Sign in with Apple",
                        showAppleIcon: true,
                      ),
                      SizedBox(height: h * 0.06),
                      Center(
                        child: Text(
                          "Login Required. Signup with\nFacebook or Google for Continue to\npayment process.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: h * 0.0225, //  17,
                            color: greyDark,
                            fontFamily: futuraBookFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: h * 0.04),
              height: h * 0.004,
              width: w * 0.15,
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _loginButton extends StatelessWidget {
  void Function()? onTap;
  String? title;
  bool? showAppleIcon;
  String? icon;

  _loginButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.showAppleIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: yellow),
        ),
        child: Row(
          children: [
            SizedBox(width: w * 0.15),
            showAppleIcon!
                ? Icon(
                    Icons.apple,
                    size: 30,
                  )
                : Container(
                    height: h * 0.03,
                    width: w * 0.07,
                    child: Image.asset(icon!),
                  ),
            SizedBox(width: w * 0.05),
            Flexible(
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: h * 0.026, // 20,20,
                      color: darkBlue,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/constant.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/preference/sharedPref.dart';
import 'package:woocom/theme/colors.dart';
import 'dart:core';

class SettingScreen extends StatefulWidget {
  // const SettingScreen({Key key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  String? userName = "", userEmail = "";

  getPref() async {
    userName = await SharedPref().read(kUserNAME);
    userEmail = await SharedPref().read(kUserMAIL);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getPref(),
      builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.02),
                Text(
                  "Profile Setting",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 20,
                    color: yellow,
                  ),
                ),
                SizedBox(height: h * 0.015),
                ListTile(
                  onTap: () {},
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.userCircle,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "User Name",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.mail,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "UserName@gmail.com",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.editProfileScreen);
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.updateProfile,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "Profile Update",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                SizedBox(height: h * 0.025),
                Text(
                  "General Setting",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 20,
                    color: yellow,
                  ),
                ),
                SizedBox(height: h * 0.015),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.wishListScreen);
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.wishlist,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "Whishlist",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.languageScreen);
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.language,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "Language",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.orderListScreen);
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.orders,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "Orders",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.theme,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 0.0,
                  ),
                  dense: true,
                  title: Text(
                    "Theme",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Container(
                    width: w * 0.16,
                    alignment: Alignment(w * 0.017, 0),
                    child: Switch(
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      value: isSwitched,
                      activeColor: lightBlue,
                      activeTrackColor: greyLight3,
                      inactiveThumbColor: lightBlue,
                      inactiveTrackColor: greyLight3,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.aboutUsScreen);
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(
                    AppIcon.aboutUs,
                    height: h * 0.037,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "About Us",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      RenderBox box = context.findRenderObject() as RenderBox;
                      Share.share("check out my website https://example.com",
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    });
                  },
                  horizontalTitleGap: w * 0.02,
                  leading: Image.asset(AppIcon.share, height: h * 0.037),
                  contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                  dense: true,
                  title: Text(
                    "Share",
                    style: TextStyle(
                      fontFamily: futuraMediumBt,
                      fontSize: 17,
                      color: darkBlue,
                    ),
                  ),
                  trailing: Image.asset(
                    AppIcon.arrowBack,
                    height: h * 0.016,
                  ),
                ),
                // ListTile(
                //     onTap: () {
                //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAppSearch()));
                //     },
                //     horizontalTitleGap: w * 0.02,
                //     leading: Image.asset(share, height: h * 0.037),
                //     contentPadding: EdgeInsets.symmetric(vertical: w * 0.00),
                //     dense: true,
                //     title: Text("Search Place",
                //         style: TextStyle(
                //           // fontFamily: "Futura_Book_Font",
                //             fontFamily: futuraMediumBt,
                //             fontSize: 17,
                //             color: darkBlue)),
                //     trailing: Image.asset(arrowBack, height: h * 0.016))
              ],
            ),
          ),
        );
      },
    );
  }
}

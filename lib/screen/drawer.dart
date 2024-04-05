import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocom/const/constant.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/main.dart';
import 'package:woocom/preference/sharedPref.dart';
import 'package:woocom/screen/Setting/about_us.dart';
import 'package:woocom/screen/Setting/edit_profile.dart';
import 'package:woocom/screen/Setting/order_list.dart';
import 'package:woocom/screen/Setting/wishlist.dart';
import 'package:woocom/screen/dashBoard.dart';
import 'package:woocom/theme/colors.dart';

Widget buildChildListTile(BuildContext context, String text, var onTap) {
  var w = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: w * 0.1),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 18,
          color: ligntBlueText,
          fontFamily: futuraBoldFont,
        ),
      ),
    ),
  );
}

ListTile buildListTile(BuildContext context, var icon, String text, var onTap) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(vertical: 0),
    minVerticalPadding: 0,
    minLeadingWidth: 0,
    dense: true,
    leading: Container(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.06,
      child: Image.asset(
        icon,
        fit: BoxFit.contain,
      ),
    ),
    title: Container(
      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          color: white,
          fontFamily: futuraBoldFont,
        ),
      ),
    ),
    onTap: onTap,
  );
}

Widget buildDrawer(BuildContext context) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Padding(
    padding: EdgeInsets.only(
      left: w * 0.04,
      right: w * 0.1,
    ),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.08),
            child: Image.asset(
              AppIcon.drawerLogo,
              width: w * 0.57,
            ),
          ),
          SizedBox(height: h * 0.03),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(context, AppIcon.drawerHome, "Home", () {
            print("Home");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DashBoardScreen(),
              ),
            );
          }),
          SizedBox(height: h * 0.015),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(
            context,
            AppIcon.drawerEditProfile,
            "Edit Profile",
            () {
              print("Edit Profile");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ),
              );
            },
          ),
          SizedBox(height: h * 0.015),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(
            context,
            AppIcon.drawerWhishList,
            "Whishlist",
            () {
              print("Whishlist");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishListScreen(),
                ),
              );
            },
          ),
          SizedBox(height: h * 0.015),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(
            context,
            AppIcon.drawerMyOrders,
            "My Orders",
            () {
              print("My Orders");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderListScreen(),
                ),
              );
            },
          ),
          SizedBox(height: h * 0.015),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(
            context,
            AppIcon.drawerAboutUs,
            "About Us",
            () {
              print("About Us");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUsScreen(),
                ),
              );
            },
          ),
          SizedBox(height: h * 0.015),
          Divider(height: h * 0.008),
          SizedBox(height: h * 0.015),
          buildListTile(
            context,
            AppIcon.drawerLogout,
            "Logout",
            () {
              logoutTile(context);
            },
          ),
          SizedBox(height: h * 0.015),
        ],
      ),
    ),
  );
}

logoutTile(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          "Are you sure you want to logout ?",
          style: TextStyle(
            fontFamily: futuraMediumBt,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "No",
              style: TextStyle(
                fontFamily: futuraBoldFont,
                fontSize: 18,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              "Yes",
              style: TextStyle(
                fontFamily: futuraBoldFont,
                fontSize: 18,
              ),
            ),
            onPressed: () async {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return MyApp();
              }), (Route<dynamic> route) => false);
            },
          )
        ],
      );
    },
  );
}

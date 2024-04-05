import 'package:flutter/material.dart';
import 'package:woocom/theme/colors.dart';
import 'dart:ui';

Color disabledColor = Color(0xff747474);
Color primaryColor = Color(0xFF39c526);
// Color primaryColor = Color(0xffFD696F);

//app theme
final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'ProductSans',
  backgroundColor: Colors.black,
  primaryColor: primaryColor,
  bottomAppBarColor: Colors.white,
  dividerColor: greyLight4,
  // disabledColor: disabledColor,
  // buttonColor: primaryColor,
  focusColor: Color(0xff7b49c3),
  indicatorColor: primaryColor,
  // accentColor: primaryColor,
  cardColor: Color(0xff222e3e),
  hintColor: Color(0xffa3a3a3),
  bottomAppBarTheme: BottomAppBarTheme(color: primaryColor),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
  ),
  //text theme which contains all text styles
  textTheme: TextTheme(
    //default text style of Text Widget
    bodyText1: TextStyle(),
    bodyText2: TextStyle(),
    subtitle1: TextStyle(),
    subtitle2: TextStyle(color: disabledColor),
    headline3: TextStyle(),
    headline4: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(color: disabledColor),
    caption: TextStyle(),
    overline: TextStyle(),
    button: TextStyle(),
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: lightBlue),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
///

//
// class Styles {
//
//   static ThemeData themeData(bool isDarkTheme, BuildContext context) {
//     return ThemeData(
//       primarySwatch: Colors.red,
//       primaryColor: isDarkTheme ? Colors.black : Colors.white,
//
//       backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
//
//       indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
//       buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
//
//       hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
//
//       highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
//       hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
//
//       focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
//       disabledColor: Colors.grey,
//       textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
//       cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
//       canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
//       brightness: isDarkTheme ? Brightness.dark : Brightness.light,
//       buttonTheme: Theme.of(context).buttonTheme.copyWith(
//           colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
//       appBarTheme: AppBarTheme(
//         elevation: 0.0,
//       ),
//     );
//
//   }
// }

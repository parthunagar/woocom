import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/screen/Setting/about_us.dart';
import 'package:woocom_3_16_9/screen/Setting/edit_profile.dart';
import 'package:woocom_3_16_9/screen/Setting/language.dart';
import 'package:woocom_3_16_9/screen/Setting/order_list.dart';
import 'package:woocom_3_16_9/screen/Setting/wishlist.dart';
import 'package:woocom_3_16_9/screen/cart.dart';
import 'package:woocom_3_16_9/screen/cartScreen.dart';
import 'package:woocom_3_16_9/screen/categorywise_list.dart';
import 'package:woocom_3_16_9/screen/checkout_address.dart';
import 'package:woocom_3_16_9/screen/checkout_payment.dart';
import 'package:woocom_3_16_9/screen/checkout_shipping.dart';
import 'package:woocom_3_16_9/screen/dashBoard.dart';
import 'package:woocom_3_16_9/screen/home/home.dart';
import 'package:woocom_3_16_9/screen/notification_list.dart';
import 'package:woocom_3_16_9/screen/order_placed.dart';
import 'package:woocom_3_16_9/screen/product_details.dart';
import 'package:woocom_3_16_9/screen/Setting/wishlist.dart';
import 'package:woocom_3_16_9/screen/searchScreen.dart';
import 'package:woocom_3_16_9/screen/setting.dart';
import 'package:woocom_3_16_9/screen/store.dart';
import 'package:woocom_3_16_9/screen/dashBoard.dart';

class PageRoutes {

  PageRoutes() {
  }

  static const String dashBoardScreenPage = 'dashBoardScreenPage';
  static const String homeScreenPage = 'homeScreenPage';
  static const String storeScreenPage = 'storeScreenPage';
  static const String cartScreenPage = 'cartScreenPage';
  static const String cartAdvanceScreenPage = 'cartAdvanceScreenPage';
  static const String settingScreenPage = 'settingScreenPage';
  static const String categoryWiseList = 'categoryWiseList';
  static const String productDetailScreen = 'productDetailScreen';
  static const String checkOutAddressScreen = 'checkOutAddressScreen';
  static const String checkOutShippingScreen = 'checkOutShippingScreen';
  static const String checkOutPaymentScreen = 'checkOutPaymentScreen';
  static const String orderPlacedScreen = 'orderPlacedScreen';
  static const String editProfileScreen = 'editProfileScreen';
  static const String aboutUsScreen = 'aboutUsScreen';
  static const String languageScreen = 'languageScreen';
  static const String orderListScreen = 'orderListScreen';
  static const String wishListScreen = 'wishListScreen';
  static const String searchProductListScreen = 'searchProductListScreen';
  static const String notificationListScreen = 'notificationListScreen';

  Map<String, WidgetBuilder> routes() {
    return {
      dashBoardScreenPage: (context) => DashBoardScreen(),
      homeScreenPage: (context) => HomeScreen(),
      storeScreenPage: (context) => StoreScreen(),
      cartScreenPage: (context) => CartScreen(),
      cartAdvanceScreenPage: (context) => CartAdvanceScreen(),
      settingScreenPage: (context) => SettingScreen(),
      categoryWiseList: (context) => CategoryWiseList(),
      productDetailScreen: (context) => ProductDetailScreen(),
      checkOutAddressScreen: (context) => CheckOutAddressScreen(),
      checkOutShippingScreen: (context) => CheckOutShippingScreen(),
      checkOutPaymentScreen: (context) => CheckOutPaymentScreen(),
      orderPlacedScreen: (context) => OrderPlacedScreen(),
      editProfileScreen: (context) => EditProfileScreen(),
      aboutUsScreen: (context) => AboutUsScreen(),
      languageScreen: (context) => LanguageScreen(),
      orderListScreen: (context) => OrderListScreen(),
      wishListScreen: (context) => WishListScreen(),
      searchProductListScreen: (context) => SearchProductListScreen(),
      notificationListScreen: (context) => NotificationList()
    };

  }
}

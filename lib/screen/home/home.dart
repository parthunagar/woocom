import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/screen/home/widget/auto_scroll_view.dart';
import 'package:woocom_3_16_9/screen/home/widget/category_view_horizontal.dart';
import 'package:woocom_3_16_9/screen/home/widget/sponsored_product.dart';
import 'package:woocom_3_16_9/screen/home/widget/surprised_for_friend.dart';
import 'package:woocom_3_16_9/screen/home/widget/kit_for_you_widget.dart';
import 'package:woocom_3_16_9/screen/home/widget/popular_product_widget.dart';
import 'package:woocom_3_16_9/screen/home/widget/search_widget.dart';
import 'package:woocom_3_16_9/screen/home/widget/you_view_recently.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget(),
                SizedBox(height: 16),
                CategoryListWidget(),
                SizedBox(height: 16),
                AutoScrollViewWidget(),
                SizedBox(height: 16),
                PopularProductWidget(),
                SizedBox(height: 16),
                YouViewRecentlyWidget(),
                SizedBox(height: 16),
                SponsoredProductView(),
                SizedBox(height: 16),
                KitForYouWidget(),
                SizedBox(height: 16),
                SurprisedForFriendView(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

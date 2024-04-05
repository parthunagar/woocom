import 'dart:async';
import 'package:flutter/material.dart';
import 'package:woocom/Components/Simmer/shimmer_HomeCategoryWiseProductList.dart';
import 'package:woocom/Components/Simmer/shimmer_you_view_recently.dart';
import 'package:woocom/Components/product_card.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/screen/home/widget/build_row_widget.dart';
import 'package:woocom/utils/app_icon_utils.dart';

class YouViewRecentlyWidget extends StatefulWidget {
  // const YouViewRecentlyWidget({super.key});

  @override
  State<YouViewRecentlyWidget> createState() => _YouViewRecentlyWidgetState();
}

class _YouViewRecentlyWidgetState extends State<YouViewRecentlyWidget> {
  Timer? timer;
  bool showHomeData = false;
  bool showAllPopularProducts = false;

  Future getData() async {
    timer = Timer(Duration(seconds: 2), () {
      if (this.mounted) {
        setState(() {
          showHomeData = true;
        });
      }
    });
    return showHomeData;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  List recentList = [
    [AppIcon.appleIPadAir4_5, 'IPad Air 4', '499',Colors.redAccent],
    [AppIcon.appleIPadAir2022_2, 'IPad Air', '799',Colors.deepOrangeAccent],
    [AppIcon.appleIPhoneSE_4, 'IPhone SE', '399',Colors.blueAccent],
    [AppIcon.iPhoneXS1, 'IPhone XS', '1099',Colors.cyanAccent],
    [AppIcon.iPhone11Pro_3, 'IPhone 11 Pro', '1199',Colors.limeAccent],
    [AppIcon.appleIPhone12_2, 'IPhone 12', '1099',Colors.pinkAccent],
    [AppIcon.appleIPhone13ProMax_3, 'IPhone 13 Pro Max', '1399',Colors.tealAccent],
    [AppIcon.appleAirPods2ndGeneration7, 'Apple AirPods 2nd Generation', '299',Colors.greenAccent],
    [AppIcon.miTrueWirelessEarbudsBasic2s5, 'Mi True Wireless Earbuds Basic 2s', '99',Colors.amberAccent],
    [AppIcon.huaweiMateBook3, 'Huawei Mate X', '599',Colors.indigoAccent],
    [AppIcon.huaweiMateBook1, 'Huawei Mate Book', '2599',Colors.orangeAccent],
    [AppIcon.laptopDellXPS135, 'Laptop Dell XPS 13', '3599',Colors.purpleAccent],
    [AppIcon.onePlus7Pro3, 'OnePlus 7 Pro', '1099',Colors.yellowAccent],
    [AppIcon.onePlus8Pro4, 'OnePlus 8 Pro', '1299',Colors.lightBlueAccent],
    [AppIcon.onePlus10Pro1, 'OnePlus 10 Pro', '1399',Colors.deepOrangeAccent],
    [AppIcon.oneplusAcePro1, 'OnePlus ACE Pro', '1099',Colors.deepPurpleAccent],
    [AppIcon.onePlusNordCE27, 'OnePlus Nord CE 2', '999',Colors.lightGreenAccent],
    [AppIcon.googlePixel4XL3, 'Google Pixel 4XL', '999',Colors.deepOrangeAccent.shade200],
    [AppIcon.googlePixel6Pro3, 'Google Pixel 6 Pro', '1099',Colors.redAccent],
    [AppIcon.samsungGalaxyZFlip42, 'Samsung GalaxyZ Flip 4', '3099',Colors.blueAccent],
    [AppIcon.samsungGalaxyS22Ultra3, 'Samsung Galaxy S22 Ultra', '1099',Colors.cyanAccent],
    [AppIcon.samsungGalaxyS224, 'Samsung Galaxy S22', '999',Colors.limeAccent],
    [AppIcon.samsungGalaxyS21Ultra7, 'Samsung Galaxy S21 Ultra', '999',Colors.pinkAccent],
    [AppIcon.samsungGalaxyM231, 'Samsung Galaxy M23', '399',Colors.tealAccent],
    [AppIcon.samsungGalaxyA232, 'Samsung Galaxy A23', '599',Colors.greenAccent],
    [AppIcon.galaxyZFlipPurple3, 'Samsung Galaxy Z Flip', '999',Colors.amberAccent],
    [AppIcon.appleWatch5Purple5, 'Apple Watch 5', '1399',Colors.indigoAccent],
    [AppIcon.appleWatch68, 'Apple Watch 6', '1399',Colors.orangeAccent],
    [AppIcon.samsungGalaxyWatch444mm7, 'Samsung Galaxy Watch 4 44mm', '599',Colors.purpleAccent],
    [AppIcon.samsungGalaxyWatch5Pro3, 'Samsung Galaxy Watch 5 Pro', '699',Colors.yellowAccent],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRowWidget(
          title: "You View Recently",
          showLeadingIcon: true,
          onTapLeadingIcon: () {
            setState(() {
              showAllPopularProducts = true;
            });
          },
        ),
        SizedBox(height: 16),
        Container(
          height: 240, //MediaQuery.of(context).size.height * 0.29,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return showHomeData == false
                  ? ShimmerYouViewRecentlyList()
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: showAllPopularProducts ? recentList.length : 3,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRoutes.productDetailScreen);
                          },
                          // backGroundColor: recentList[index][3].withOpacity(0.3),
                          onTapFavourite: () {},
                          productImage: recentList[index][0],//  index % 2 == 0 ? AppIcon.bagImg1 : AppIcon.bagImg2,
                          // initialRating: index % 2 == 0 ? 3 : 4,
                          showSaleIcon: false,
                          showFavouriteIcon: false,
                          showDecorateImage: false,
                          showRatingBar: false,
                          showTotalSales: false,
                          // favouriteIcon: index % 2 == 0 ? AppIcon.fillLikeBlue : AppIcon.fillOutLikeBlue,
                          productName:  recentList[index][1],//'Wrist Pro Watch',
                          // totalSales: '${index + 1}',
                          price:  recentList[index][2], // '${index + 1}5',
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}

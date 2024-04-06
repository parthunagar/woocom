import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/custom_rating_bar.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class ProductCard extends StatelessWidget {
  void Function()? onTap, onTapFavourite;
  String? productImage;
  bool? showSaleIcon,
      showFavouriteIcon,
      showRatingBar,
      showTotalSales,
      showDecorateImage;
  String? favouriteIcon;
  String? productName;
  double? initialRating;
  String? totalSales, price;
  Color? backGroundColor;

  ProductCard({
    Key? key,
    required this.onTap,
    this.onTapFavourite,
    required this.productImage,
    this.initialRating,
    this.showSaleIcon = true,
    this.showFavouriteIcon = true,
    this.showRatingBar = true,
    this.showTotalSales = true,
    this.showDecorateImage = true,
    this.favouriteIcon,
    required this.productName,
    this.totalSales,
    required this.price,
    this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w * 0.45,
        decoration: BoxDecoration(
          color: backGroundColor ?? white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: lightBlue,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    showDecorateImage!
                        ? Container(
                            height: h * 0.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  productImage!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: h * 0.2,
                            alignment: Alignment.center,
                            // margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Image.asset(
                              productImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                    showSaleIcon!
                        ? Positioned(
                            left: 10,
                            child: Image.asset(
                              AppIcon.saleIcon,
                              height: h * 0.035,
                            ),
                          )
                        : SizedBox(),
                    showFavouriteIcon!
                        ? Positioned(
                            right: 10,
                            top: 10,
                            child: GestureDetector(
                              onTap: onTapFavourite ?? () {},
                              child: Image.asset(
                                favouriteIcon!,
                                height: h * 0.025,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: h * 0.007),
                          Text(
                            productName!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: futuraLightBt,
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: h * 0.005),
                          showRatingBar!
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomRatingBar(
                                          initialRating: initialRating!,
                                          itemSize: h * 0.027,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: h * 0.007),
                                  ],
                                )
                              : SizedBox(),
                          showTotalSales!
                              ? Column(
                                  children: [
                                    Text(
                                      'Total Sales: $totalSales',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: futuraLightBt,
                                        fontSize: 13,
                                        color: black,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.01),
                                  ],
                                )
                              : SizedBox(),
                          Text(
                            '\$$price',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: futuraHeavyFont,
                              fontSize: 15,
                              color: lightBlue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: h * 0.04,
                width: h * 0.04,
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Image.asset(
                    AppIcon.shoppingCart2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

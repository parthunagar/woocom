import 'package:flutter/material.dart';
// import 'package:rating_bar/rating_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:woocom_3_16_9/Components/custom_rating_bar.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class ShimmerCategoryWiseProductList extends StatefulWidget {
  // const ShimmerCategoryWiseProductList({Key key}) : super(key: key);

  @override
  _ShimmerCategoryWiseProductListState createState() =>
      _ShimmerCategoryWiseProductListState();
}

class _ShimmerCategoryWiseProductListState
    extends State<ShimmerCategoryWiseProductList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Shimmer(
      color: Colors.white,
      enabled: true,
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        width: w * 0.45,
        margin: EdgeInsets.only(right: w * 0.04),
        decoration: BoxDecoration(
          color: shimmerGreyIcon,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: shimmerGrey,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: h * 0.21,
                      decoration: BoxDecoration(
                        color: shimmerGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: w * 0.02),
                      child: Image.asset(
                        AppIcon.saleIcon,
                        color: shimmerGreyIcon,
                        height: h * 0.035,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: h * 0.01,
                          right: w * 0.02,
                        ),
                        child: Image.asset(
                          AppIcon.fillOutLikeBlue,
                          color: shimmerGreyIcon,
                          height: h * 0.025,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: h * 0.007),
                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(20)
                          //   ),
                          // ),
                          Container(
                            height: h * 0.022,
                            width: w * 0.3,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),

                          SizedBox(height: h * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomRatingBar(
                                initialRating: 5.0,
                                itemSize: h * 0.027,
                              ),

                            ],
                          ),
                          SizedBox(height: h * 0.01),
                          Container(
                            height: h * 0.014,
                            width: w * 0.2,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: h * 0.014),
                          Container(
                            height: h * 0.014,
                            width: w * 0.2,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: h * 0.04,
                width: h * 0.04,
                // color: yellow,
                // width: w * 0.08,
                decoration: BoxDecoration(
                  color: shimmerGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomRight: Radius.circular(9),
                  ),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      shimmerGreyIcon,
                      BlendMode.dstOut,
                    ),
                    image: AssetImage(
                      AppIcon.rectangle,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Image.asset(
                    AppIcon.shoppingCart2,
                    color: shimmerGreyIcon,
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

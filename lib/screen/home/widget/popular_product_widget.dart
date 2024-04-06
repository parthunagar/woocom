import 'dart:async';
import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/Simmer/shimmer_HomeCategoryWiseProductList.dart';
import 'package:woocom_3_16_9/Components/product_card.dart';
import 'package:woocom_3_16_9/Routes/routes.dart';
import 'package:woocom_3_16_9/screen/home/widget/build_row_widget.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';

class PopularProductWidget extends StatefulWidget {
  // const PopularProductWidget({super.key});

  @override
  State<PopularProductWidget> createState() => _PopularProductWidgetState();
}

class _PopularProductWidgetState extends State<PopularProductWidget> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRowWidget(
          title: "Popular Products",
          showLeadingIcon: true,
          onTapLeadingIcon: () {
            setState(() {
              showAllPopularProducts = true;
            });
          },
        ),
        SizedBox(height: 16),
        Container(
          height: MediaQuery.of(context).size.height * 0.34,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return showHomeData == false
                  ? ShimmerHomeCategoryWiseProductList()
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: showAllPopularProducts ? 20 : 3,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRoutes.productDetailScreen);
                          },
                          onTapFavourite: () {},
                          productImage: index % 2 == 0
                              ? AppIcon.bagImg1
                              : AppIcon.bagImg2,
                          initialRating: index % 2 == 0 ? 3 : 4,
                          favouriteIcon: index % 2 == 0
                              ? AppIcon.fillLikeBlue
                              : AppIcon.fillOutLikeBlue,
                          productName: 'Wrist Pro Watch',
                          totalSales: '${index + 1}',
                          price: '${index + 1}5',
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

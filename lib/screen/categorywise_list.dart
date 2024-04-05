import 'dart:async';
import 'package:flutter/material.dart';
import 'package:woocom/Components/Arguments/screen_arguments.dart';
import 'package:woocom/Components/Simmer/shimmer_CategoryWiseProductList.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Components/filter_color.dart';
import 'package:woocom/Components/filter_type.dart';
import 'package:woocom/Components/product_card.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/const/constant.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart' as theme;

class CategoryWiseList extends StatefulWidget {
  String? title;

  CategoryWiseList({this.title});

  @override
  _CategoryWiseListState createState() => _CategoryWiseListState();
}

class _CategoryWiseListState extends State<CategoryWiseList> {
  SfRangeValues _values1 = SfRangeValues(1.0, 100.0);

  var categoryWiseProductDetail;

  bool showData = false;

  Timer? timer;

  Future getData() async {
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        showData = true;
      });
    });
    return showData;
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
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: args.productTitle.toString(),
        action: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.021),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  setTrueFilter();
                });
                showFilterMenu(h, w);
              },
              child: Image.asset(AppIcon.featherFilter),
            ),
          ),
          SizedBox(width: w * 0.04),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
          vertical: h * 0.02,
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, state) {
            if (showData == false) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: w / (h / 1.3),
                  crossAxisSpacing: w * 0.04,
                  mainAxisSpacing: h * 0.03,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ShimmerCategoryWiseProductList();
                },
              );
            }
            return GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: w / (h / 1.3),
                crossAxisSpacing: w * 0.04,
                mainAxisSpacing: h * 0.03,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  onTap: () {
                    Navigator.pushNamed(
                        context, PageRoutes.productDetailScreen);
                  },
                  onTapFavourite: () {},
                  productImage:
                      index % 2 == 0 ? AppIcon.bagImg2 : AppIcon.bagImg1,
                  initialRating: index % 2 == 0 ? 3 : 4,
                  favouriteIcon: index % 2 == 0
                      ? AppIcon.fillLikeBlue
                      : AppIcon.fillOutLikeBlue,
                  productName: index % 2 == 0 ? 'Pro Bag' : 'Wrist Pro Watch',
                  totalSales: '${index + 1}',
                  price: '${index + 1}5',
                );
              },
            );
          },
        ),
      ),
    );
  }

  showFilterMenu(var h, var w) {
    showModalBottomSheet(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(45.0),
          topLeft: Radius.circular(45.0),
        ),
      ),
      context: context,
      builder: (context) {
        return tapFilterIcon == false
            ? SizedBox()
            : StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: h * 0.55,
                      width: w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.04,
                          vertical: h * 0.02,
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  setFalseFilter();
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                height: h * 0.05,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Filters",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: futuraMediumBt,
                                        ),
                                      ),
                                      Image.asset(AppIcon.closeCircle,
                                          height: h * 0.03),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: h * 0.02),
                                    Text(
                                      "Type",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: futuraHeavyFont,
                                      ),
                                    ),
                                    FilterTypeView(),
                                    SizedBox(height: h * 0.025),
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: futuraHeavyFont,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.04),
                                    theme.SfRangeSliderTheme(
                                      data: theme.SfRangeSliderThemeData(
                                        tooltipBackgroundColor: transparent,
                                        inactiveTrackColor: greyLight3,
                                        activeTrackColor: lightBlue,
                                        thumbColor: lightBlue,
                                        overlayColor:
                                            lightBlue.withOpacity(0.1),
                                        tooltipTextStyle: TextStyle(
                                          color: black,
                                          fontFamily: futuraBookFont,
                                        ),
                                      ),
                                      child: SfRangeSlider(
                                        min: 1.0,
                                        max: 100.0,
                                        showTicks: false,
                                        showLabels: false,
                                        enableTooltip: true,
                                        values: _values1,
                                        onChanged: (SfRangeValues newValues) {
                                          setState(() {
                                            _values1 = newValues;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Colour",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: futuraHeavyFont,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.01),
                                    FilterColorView(),
                                    SizedBox(height: h * 0.06),
                                    Center(
                                      child: CustomButton(
                                        label: "Apply",
                                        lableSize: 19,
                                        width: w * 0.5,
                                        height: h * 0.055,
                                        fontWeight: FontWeight.normal,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(height: h * 0.02),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}

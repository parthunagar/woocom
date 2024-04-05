import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:rating_bar/rating_bar.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/custom_rating_bar.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/theme/colors.dart';

class SearchProductListScreen extends StatefulWidget {
  final String? searchKeyword;

  SearchProductListScreen({this.searchKeyword});

  @override
  _SearchProductListScreenState createState() =>
      _SearchProductListScreenState();
}

class _SearchProductListScreenState extends State<SearchProductListScreen> {
  TextEditingController? searchC;
  late bool isSearchValue = false;

  @override
  void initState() {
    super.initState();
    searchC = TextEditingController(text: widget.searchKeyword);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: searchC,
              onSubmitted: (value) {
                setState(() {
                  FocusScope.of(context).unfocus();
                });
              },
              onChanged: (value) {
                setState(() {
                  if (value == "") {
                    print(value);
                    isSearchValue = false;
                  } else {
                    print(value);
                    isSearchValue = true;
                  }
                });
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: greyLight.withOpacity(0.01),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.0),
                  child: Image.asset(
                    AppIcon.search,
                    height: h * 0.02,
                  ),
                ),
                border: InputBorder.none,
                hintText: 'Search products...',
              ),
            ),
            Visibility(
              visible: !isSearchValue,
              child: Center(
                child: Text(
                  "Search Here....",
                  style: TextStyle(
                    fontFamily: futuraMediumBt,
                    fontSize: 16,
                    color: greyDark,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isSearchValue,
              child: Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: w / (h / 1.3),
                      crossAxisSpacing: w * 0.04,
                      mainAxisSpacing: h * 0.03,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRoutes.productDetailScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: lightBlue,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: h * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          index % 2 == 0 ? AppIcon.bagImg2 : AppIcon.bagImg1,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    child: Image.asset(
                                      AppIcon.saleIcon,
                                      height: h * 0.035,
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Image.asset(
                                      index % 2 == 0
                                          ? AppIcon.fillLikeBlue
                                          : AppIcon.fillOutLikeBlue,
                                      height: h * 0.025,
                                    ),
                                  )
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.015,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: h * 0.007),
                                      Text(
                                        index % 2 == 0
                                            ? 'Pro Bag'
                                            : 'Wrist Pro Watch',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: futuraMediumBt,
                                          fontSize: 16,
                                          color: black,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.005),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomRatingBar(
                                            initialRating:
                                                index % 2 == 0 ? 3 : 4,
                                            itemSize: h * 0.025,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: h * 0.007),
                                      Text(
                                        'Total Sales: ${index + 1}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: futuraLightBt,
                                          fontSize: 13,
                                          color: black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.015,
                                      ),
                                      child: Text(
                                        '\$${index + 1}5',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: futuraHeavyFont,
                                          fontSize: 15,
                                          color: lightBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: h * 0.035,
                                      width: w * 0.07,
                                      decoration: BoxDecoration(
                                        color: lightBlue,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8),
                                        ),
                                        // image: DecorationImage(image: AssetImage(rectangle)),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Image.asset(AppIcon.shoppingCart2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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

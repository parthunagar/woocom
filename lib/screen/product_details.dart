import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// import 'package:rating_bar/rating_bar.dart';
import 'package:woocom/Components/appbar.dart';
import 'package:woocom/Components/commonwidget.dart';
import 'package:woocom/Components/custom_rating_bar.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/screen/cart.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/const/constant.dart';

class ProductDetailScreen extends StatefulWidget {
  // const ProductDetailScreen({Key key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentSliderPage = 0;
  int currentSize = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Details',
        action: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.021),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(AppIcon.shoppingCart1),
                      Container(
                        height: h * 0.013,
                        width: w * 0.025,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 8,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: w * 0.04),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: h * 0.02),
                  CarouselSlider(
                    items: productDetailData
                        .map(
                          (item) => Container(
                            child: Image.asset(
                              item,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: false,
                      aspectRatio: 1.5,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _currentSliderPage = index;
                            print("_currentSliderPage : " +
                                _currentSliderPage.toString());
                            print("reason : " + reason.toString());
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: productDetailData.map(
                      (url) {
                        print("productDetailData.indexOf(url) : " +
                            productDetailData.indexOf(url).toString());
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: _currentSliderPage == productDetailData.indexOf(url) ? 10 :7.0,
                          height:  8.0,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentSliderPage == productDetailData.indexOf(url)
                                ? lightBlue
                                : ligntBlueText,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  SizedBox(height: h * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Travelling Bag",
                        style: TextStyle(
                          fontFamily: futuraHeavyFont,
                          fontSize: 20,
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomRatingBar(
                        initialRating: 2.5,
                        itemSize: h * 0.025,
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.015),
                  Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.\n- Double handles\n- Top zipper opening\n- Inside two open and one zipper section with small side open and zipper pocket",
                      style: TextStyle(color: grey)),
                  SizedBox(height: h * 0.02),
                  Text(
                    "Size",
                    style: TextStyle(
                      color: lightBlue,
                      fontSize: 16,
                      fontFamily: futura,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: sizeData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentSize = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: w * 0.08,
                            // width: currentSize == index ? 35 : 30,
                            // height: currentSize == index ? 35 : 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: black, width: 0.7),
                              borderRadius: BorderRadius.circular(6),
                              color: currentSize == index ? lightBlue : white,
                            ),
                            // margin: EdgeInsets.only(right: w * 0.02),
                            child: Center(
                              child: Text(
                                sizeData[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: futuraBookFont,
                                  fontWeight: FontWeight.bold,
                                  color: currentSize == index ? white : black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Text(
                    "Color",
                    style: TextStyle(
                      color: lightBlue,
                      fontSize: 16,
                      fontFamily: futura,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.025,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 8);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: colorData.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            width: currentColor == index ? w * 0.06 : w * 0.05,
                            // height: 40,
                            decoration: BoxDecoration(
                              color: Color(int.parse("0x" + colorData[index])),
                              border: Border.all(
                                color: currentColor == index ? black : transparent,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              height: h * 0.1,
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$100",
                    style: TextStyle(
                      color: yellow,
                      fontSize: 33,
                      fontFamily: futuraHeavyFont,
                    ),
                  ),
                  CustomButton(
                    label: "Add to Cart",
                    lableSize: 19,
                    width: w * 0.55,
                    fontWeight: FontWeight.normal,
                    margin: EdgeInsets.symmetric(vertical: h * 0.018),
                    onTap: () {
                      Navigator.pushNamed(
                          context, PageRoutes.cartAdvanceScreenPage);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

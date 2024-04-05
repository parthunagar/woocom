import 'dart:async';
import 'package:flutter/material.dart';
import 'package:woocom/Components/Arguments/screen_arguments.dart';
import 'package:woocom/Components/Simmer/shimmer_HomeCategoryList.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/model/category_list_model.dart';
import 'package:woocom/theme/colors.dart';

class CategoryListWidget extends StatefulWidget {
  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  Timer? timer;
  bool showHomeData = false;
  List<CategoryList>? categoryListData = [];

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
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryListData().then((value) {
      setState(() {
        categoryListData = value;
        print('categoryListData : $categoryListData');
      });
    });
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontFamily: futuraLightBt,
            fontSize: 20,
            color: black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: h * 0.12,
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return showHomeData == false
                  ? ShimmerHomeCategoryList()
                  : ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryListData!.length, // 20,
                      itemBuilder: (context, index) {
                        return _categoryItem(
                          height: h,
                          width: w,
                          onTap: () {
                            // getCategoryListData();
                            Navigator.pushNamed(
                              context,
                              PageRoutes.categoryWiseList,
                              arguments: ScreenArguments(
                                'Fabrics',
                              ),
                            );
                          },
                          icon: categoryListData![index].icon!,
                          title: categoryListData![index].name!,
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryItem(
      {var height,
      var width,
      void Function()? onTap,
      required String icon,
      required String title}) {
    return GestureDetector(
      onTap: () {
        // getCategoryListData();
        Navigator.pushNamed(
          context,
          PageRoutes.categoryWiseList,
          arguments: ScreenArguments(
            'Fabrics',
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 70, //w * 0.16,
            height: 70,
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: darkBlue),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  lightBlueOpacity,
                  white,
                  lightBlueOpacity,
                  white,
                  lightBlueOpacity,
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(11),
              child: Image.asset(icon),
            ),
          ),
          SizedBox(height: height * 0.01),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: futuraBookFont,
                color: greyDark,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

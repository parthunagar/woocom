import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:woocom/theme/colors.dart';

class ShimmerHomeCategoryList extends StatefulWidget {
  // const ShimmerHomeCategoryList({Key key}) : super(key: key);

  @override
  _ShimmerHomeCategoryListState createState() =>
      _ShimmerHomeCategoryListState();
}

class _ShimmerHomeCategoryListState extends State<ShimmerHomeCategoryList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: w * 0.04),
      itemCount: 10,
      itemBuilder: (context, index) => Shimmer(
        color: Colors.white,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          child: Column(
            children: [
              Container(
                height: h * 0.07,
                width: w * 0.14,
                decoration: BoxDecoration(
                  color: shimmerGrey,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: h * 0.01),
              Container(
                width: w * 0.2,
                height: h * 0.02,
                decoration: BoxDecoration(
                  color: shimmerGrey,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

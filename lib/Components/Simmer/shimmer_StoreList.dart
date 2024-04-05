import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:woocom/theme/colors.dart';

class ShimmerStoreList extends StatefulWidget {
  // const ShimmerStoreList({Key key}) : super(key: key);

  @override
  _ShimmerStoreListState createState() => _ShimmerStoreListState();
}

class _ShimmerStoreListState extends State<ShimmerStoreList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GridView.builder(
        // semanticChildCount: 10,
        itemCount: 10, // storeData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // mainAxisExtent: h*0.25,
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.7),
            crossAxisSpacing: w * 0.04, // horizontal space
            mainAxisSpacing: h * 0.01 // vertical space
            ),
        itemBuilder: (BuildContext context, int index) {
          return Shimmer(
            color: Colors.white,
            enabled: true,
            direction: ShimmerDirection.fromLTRB(),
            child: Column(
              children: [
                Container(
                  height: h * 0.19,
                  decoration: BoxDecoration(
                    color: shimmerGreyIcon,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: h * 0.01),
                Container(
                  width: w * 0.3,
                  height: h * 0.02,
                  decoration: BoxDecoration(
                    color: shimmerGrey,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

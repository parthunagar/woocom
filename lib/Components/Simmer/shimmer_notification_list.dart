import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class ShimmerNotificationList extends StatefulWidget {
  @override
  _ShimmerNotificationListState createState() =>
      _ShimmerNotificationListState();
}

class _ShimmerNotificationListState extends State<ShimmerNotificationList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: 10,
      itemBuilder: (context, index) => Shimmer(
        color: greyLight4,
        enabled: true,
        direction: ShimmerDirection.fromLTRB(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: greyLight4),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.local_shipping,
                      color: shimmerGrey,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12,
                            width: 100,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 9,
                            width: 200,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            height: 9,
                            width: 200,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            height: 9,
                            width: 150,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            height: 10,
                            width: 70,
                            decoration: BoxDecoration(
                              color: shimmerGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 8,
                            width: 140,
                            decoration: BoxDecoration(
                              color: greyLight2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: greyLight4,
                  ),
                ),
                height: 100,
                width: 100,
                padding: EdgeInsets.all(9),
                child: Icon(
                  Icons.phone_iphone_rounded,
                  size: 80,
                  color: greyLight3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

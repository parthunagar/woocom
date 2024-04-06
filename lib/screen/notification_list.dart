import 'dart:async';

import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/Simmer/shimmer_notification_list.dart';
import 'package:woocom_3_16_9/Components/appbar.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:intl/intl.dart';

class NotificationList extends StatefulWidget {
  // const NotificationList({super.key});

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  ///
  ///title, subtitle, statusIcon, product Icon
  ///
  List notificationList = [
    [
      'Order Cancelled!',
      'This order will be no londer be visible in Production Manager',
      AppIcon.statusCancelled,
      AppIcon.appleAirPods2ndGeneration1,
    ],
    [
      'Order Completed!',
      'Your Order fulfilled and complete!, No further action!',
      AppIcon.statusCompleted,
      AppIcon.appleIPadAir2022_1,
    ],
    [
      'Offer Expired!',
      'SORRY! Your Offer has been Expired and wait for a SALE!',
      AppIcon.statusExpired,
      AppIcon.appleIPhone12_4,
    ],
    [
      'Payment Failed! \$130',
      "Sorry! payment Failed, if debit into you wallet'account then get back into 24 hours!",
      AppIcon.statusFailed,
      AppIcon.appleIPhone13ProMax_2,
    ],
    [
      'Failed Delivery Attempt!',
      'WelDone!, Grab your deal with in 2 days!',
      AppIcon.statusFailedDeliveryAttempts,
      AppIcon.appleWatch5Orange3,
    ],
    [
      'In Transit!',
      'You order has been started for delivery we will back to you fastly!',
      AppIcon.statusInTransit,
      AppIcon.appleWatchNikeSEBlack1,
    ],
    [
      'Out for Delivery!',
      'Grab deal, Your product out for delevery.',
      AppIcon.statusOutForDelivery,
      AppIcon.huaweiMateBook2,
    ],
    [
      'Payment Received \$500',
      'Thans for the Grab DEAL & we will back meet you soon',
      AppIcon.statusPaymentReceived,
      AppIcon.lGUltraTab1,
    ],
    [
      'Pick up Drop off Progress',
      'Coming Soon! Your oder has been Drop for the station',
      AppIcon.statusPickupDropOffInProgress,
      AppIcon.onePlus8Pro4,
    ],
    [
      'Refund Payment \$599',
      'ohh wow refund you debited into you account/wallet.',
      AppIcon.statusRefundPayment,
      AppIcon.samsungGalaxyS225,
    ],
    [
      'Traking info Received ',
      'Order traking detail has been received!',
      AppIcon.statusTrackingInfoReceived,
      AppIcon.samsungWatchSmartCharm1,
    ],
    [
      'Wainting Payment!',
      "Hi User, I'am waiting for you payment. It's not done - FullFill a details please.",
      AppIcon.statusWaitingPayment,
      AppIcon.susZenfone8Flip4,
    ],
  ];

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
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notification',
        action: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showData = false;
                });
              },
              child: Text(
                'Clear All',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          )
        ],
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, state) {
            if (showData == false) return ShimmerNotificationList();
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemCount: notificationList.length,
              separatorBuilder: (context, index) {
                return SizedBox(height: 16);
              },
              itemBuilder: (context, index) {
                return _NotificationItemsWidget(
                  image: notificationList[index][3],
                  productStatusIcon: notificationList[index][2],
                  title: notificationList[index][0],
                  subTitle: notificationList[index][1],
                );
              },
            );
          }),
    );
  }
}

// ignore: must_be_immutable
class _NotificationItemsWidget extends StatelessWidget {
  String? title, subTitle, image, productStatusIcon;
  _NotificationItemsWidget({
    required this.image,
    required this.productStatusIcon,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightBlue),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  child: Image.asset(productStatusIcon!, color: greyLight3),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title!, overflow: TextOverflow.visible),
                      SizedBox(height: 10),
                      Text(subTitle!, overflow: TextOverflow.visible),
                      SizedBox(height: 10),
                      Text(
                        '${DateFormat('DD MMM yyyy  •  hh:mm a').format(DateTime.now())}',
                        overflow: TextOverflow.visible,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: greyLight3),
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
              border: Border.all(color: lightBlue),
            ),
            height: 100,
            width: 100,
            padding: EdgeInsets.all(9),
            child: Image.asset(image!),
          )
        ],
      ),
    );
  }
}

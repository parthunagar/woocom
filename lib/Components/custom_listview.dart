import 'package:flutter/material.dart';
import 'dart:core';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';

class CustomListViewWidget extends StatefulWidget {
  final assetImage;
  final netWorkImage;
  final String? title;
  final String? totalPrice;
  final String? actualPrice;
  final bool? showDeleteIcon;
  final onTapDelete;
  final onTapItem;

  CustomListViewWidget(
      {this.assetImage,
      this.netWorkImage,
      this.title,
      this.totalPrice,
      this.actualPrice,
      this.showDeleteIcon,
      this.onTapDelete,
      this.onTapItem});

  @override
  _CustomListViewWidgetState createState() => _CustomListViewWidgetState();
}

class _CustomListViewWidgetState extends State<CustomListViewWidget> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: widget.onTapItem ?? () {},
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: lightBlue),
                    ),
                    height: h * 0.1,
                    width: w * 0.2,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Image.asset(
                       AppIcon.bagImg6,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(left: w * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title ?? "",
                            style: TextStyle(
                              fontFamily: futuraMediumBt,
                              fontSize: 17,
                              color: black,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          Text(
                            widget.actualPrice ?? "",
                            style: TextStyle(
                              color: lightBlue,
                              fontSize: 15,
                              fontFamily: futuraHeavyFont,
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.totalPrice ?? "",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: darkBlue,
                                  fontSize: 15,
                                  fontFamily: futuraLightBt,
                                ),
                              ),
                              widget.showDeleteIcon == true
                                  ? GestureDetector(
                                      onTap: widget.onTapDelete ?? () {},
                                      child: Container(
                                        height: h * 0.02,
                                        child: Image.asset(
                                          AppIcon.iconDelete,
                                        ),
                                      ),
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.01),
              index == 10 - 1 ? SizedBox() : Divider(thickness: 0.8),
              SizedBox(height: h * 0.01),
            ],
          ),
        );
      },
    );
  }
}

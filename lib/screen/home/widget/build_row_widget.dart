import 'package:flutter/material.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/utils/app_icon_utils.dart';

class BuildRowWidget extends StatelessWidget {
  String title;
  bool showLeadingIcon;
  void Function()? onTapLeadingIcon;
  BuildRowWidget({
    required this.title,
    required this.showLeadingIcon,
    this.onTapLeadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: futuraLightBt,
            fontSize: 19,
            color: black,
            fontWeight: FontWeight.bold,
          ),
        ),
        showLeadingIcon
            ? GestureDetector(
                onTap: onTapLeadingIcon,
                child: Image.asset(
                  AppIcon.allProductIcon,
                  height: h * 0.02,
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

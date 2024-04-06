import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'dart:core';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(56);
  final String? title;
  final bool? centerTitle;
  final String? titleFamily;
  final onTap;
  final icon;
  final List<Widget>? action;

  CustomAppBar({
    this.title,
    this.centerTitle,
    this.titleFamily,
    this.onTap,
    this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      title: Text(
        title ?? '',
        style: TextStyle(
          color: lightBlue,
          fontFamily: titleFamily ?? futuraHeavyFont,
        ),
      ),
      leading: InkWell(
        onTap: onTap ??
            () {
              Navigator.pop(context);
            },
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Image.asset(
            icon ?? AppIcon.roundBack,
          ),
        ),
      ),
      actions: action ?? [],
    );
  }
}

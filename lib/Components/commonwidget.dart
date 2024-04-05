import 'package:flutter/material.dart';
import 'package:woocom/Locale/locales.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/theme/colors.dart';

class CustomButton extends StatefulWidget {
  final String? label;
  final Widget? onPress;
  final double? width;
  final Widget? prefixIcon;
  final double? iconGap;
  final double? height;
  final onTap;
  final Color? color;
  final double? border;
  EdgeInsetsGeometry? margin;
  final Color? textColor;
  EdgeInsetsGeometry? padding;
  final double? lableSize;
  final Color? borderColor;
  final FontWeight? fontWeight;

  CustomButton({
    this.label,
    this.onPress,
    this.width,
    this.prefixIcon,
    this.iconGap,
    this.height,
    this.onTap,
    this.color,
    this.border,
    this.margin,
    this.textColor,
    this.padding,
    this.lableSize,
    this.borderColor,
    this.fontWeight,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalizations.of(context);
    return InkWell(
      onTap: widget.onTap ?? () {},
      child: Container(
        width: widget.width ?? 50,
        height: widget.height ?? 56,
        margin: widget.margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: widget.color ?? lightBlue,
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            widget.border ?? 7,
          ),
        ),
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text(
                  widget.label ?? "",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: widget.lableSize ?? 17,
                    color: widget.textColor ??
                        Theme.of(context).scaffoldBackgroundColor,
                    fontFamily: futuraHeavyFont,
                    fontWeight: widget.fontWeight ?? FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            widget.prefixIcon ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

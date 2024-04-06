import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class EntryField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? image;
  final String? initialValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? hint;
  final Widget? suffixIcon;
  final Function? onTap;
  final TextCapitalization? textCapitalization;
  final onSuffixPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final Color? underlineColor;
  final Color? disabledUnderlineColor;
  final Color? labelColor;
  final TextStyle? hintStyle;
  final bool? obsecureText;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final String? inputTextFamily;
  final double? inputTextSize;
  final onEditingComplete;
  final fieldOnTap;
  final EdgeInsetsGeometry? contentPadding;
  final validation;
  final inputTextWeight;
  final hintFamily;
  final hintSize;
  final hintWeight;
  final hintColor;
  final suffixIconConstraints;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.textCapitalization,
    this.onSuffixPressed,
    this.horizontalPadding,
    this.verticalPadding,
    this.labelFontWeight,
    this.labelFontSize,
    this.labelColor,
    this.underlineColor,
    this.hintStyle,
    this.obsecureText,
    this.suffixIconColor,
    this.suffixIconSize,
    this.inputTextFamily,
    this.inputTextSize,
    this.onEditingComplete,
    this.fieldOnTap,
    this.contentPadding,
    this.validation,
    this.inputTextWeight,
    this.disabledUnderlineColor,
    this.hintFamily,
    this.hintSize,
    this.hintWeight,
    this.hintColor,
    this.suffixIconConstraints,
  });

  @override
  _EntryFieldState createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label ?? '',
          style: TextStyle(
            fontFamily: futuraBookFont,
            color: widget.labelColor ?? grey,
            fontWeight: widget.labelFontWeight ?? FontWeight.normal,
            fontSize: widget.labelFontSize ?? 16,
          ),
        ),
        TextFormField(
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.sentences,
          cursorColor: Theme.of(context).primaryColor,
          autofocus: false,
          onEditingComplete: widget.onEditingComplete ?? () {},
          onTap: widget.fieldOnTap ?? () {},
          controller: widget.controller,
          readOnly: widget.readOnly ?? false,
          keyboardType: widget.keyboardType,
          minLines: widget.minLines ?? 1,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
          obscureText: widget.obsecureText ?? false,
          validator: widget.validation,
          style: TextStyle(
            fontFamily: widget.inputTextFamily ?? futuraBookFont,
            fontSize: widget.inputTextSize ?? 16,
            fontWeight: widget.inputTextWeight ?? FontWeight.normal,
          ),

          decoration: InputDecoration(
            isDense: true,
            suffixIcon: widget.suffixIcon ?? null,
            suffixIconConstraints: widget.suffixIconConstraints ??
                BoxConstraints(
                  maxHeight: 20,
                  maxWidth: 20,
                ),
            contentPadding: widget.contentPadding ??
                EdgeInsets.only(
                  top: 9,
                  bottom: 4,
                ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.underlineColor ?? grey,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: widget.disabledUnderlineColor ?? grey,
              ),
            ),
            hintText: widget.hint,
            counterText: '',
            hintStyle: TextStyle(
              fontSize: widget.hintSize ?? 18,
              fontWeight: widget.hintWeight ?? FontWeight.normal,
              fontFamily: widget.hintFamily,
              color: widget.hintColor,
            ),
          ),
          // style: widget.style ??  TextStyle(fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:woocom/Components/appbar.dart';
import 'dart:core';
import 'package:woocom/const/constant.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/theme/colors.dart';

class LanguageScreen extends StatefulWidget {
  // const LanguageScreen({Key key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  // TODO: VARIABLE

  // Check or Unselected Language
  String radioItem = '';

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'Language'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              SizedBox(height: h * 0.01),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return Theme(
                    data: ThemeData(unselectedWidgetColor: lightBlue),
                    child: RadioListTile(
                      activeColor: lightBlue,
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                      groupValue: radioItem,
                      title: Text(
                        languageList[index],
                        style: TextStyle(
                            fontFamily: futuraMediumBt,
                            fontSize: 19,
                            color: black),
                      ),
                      value: languageList[index].toString(),
                      onChanged: (val) {
                        setState(
                          () {
                            print(val);
                            radioItem = val.toString();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

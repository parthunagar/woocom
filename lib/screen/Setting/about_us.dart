import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/appbar.dart';
import 'dart:core';

import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class AboutUsScreen extends StatefulWidget {
  // const AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.04),
          child: Column(
            children: [
              SizedBox(height: h * 0.02),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: futuraLightBt,
                  color: black,
                ),
              ),
              Text(
                "\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: futuraLightBt,
                  color: black,
                ),
              ),
              SizedBox(height: h * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

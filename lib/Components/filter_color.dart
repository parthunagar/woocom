import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'package:woocom_3_16_9/const/constant.dart';

class FilterColorView extends StatefulWidget {
  const FilterColorView({Key? key}) : super(key: key);

  @override
  State<FilterColorView> createState() => FilterColorViewState();
}

class FilterColorViewState extends State<FilterColorView> {
  int colorIndex = -1;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height * 0.034,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: filterColorData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                colorIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
              width: colorIndex == index ? w * 0.09 : w * 0.07,
              decoration: BoxDecoration(
                color: Color(int.parse("0x" + filterColorData[index])),
                shape: BoxShape.circle,
                border: Border.all(
                    color: colorIndex == index ? black : transparent),
              ),
            ),
          );
        },
      ),
    );
  }
}

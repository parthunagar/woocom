import 'package:flutter/material.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/const/constant.dart';

class FilterTypeView extends StatefulWidget {
  const FilterTypeView({Key? key}) : super(key: key);

  @override
  State<FilterTypeView> createState() => FilterTypeViewState();
}

class FilterTypeViewState extends State<FilterTypeView> {
  int typeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: EdgeInsets.only(top: h * 0.015),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filterTypeData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4.5),
          crossAxisSpacing: w * 0.03,
          mainAxisSpacing: h * 0.025),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              typeIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: typeIndex == index ? ligntBlueText : white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: typeIndex == index ? darkBlue : darkBlue,
                width: typeIndex == index ? 1.5 : 1,
              ),
            ),
            child: Center(
              child: Text(
                filterTypeData[index],
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: futuraBookFont,
                  fontWeight: typeIndex == index ? FontWeight.bold : null,
                  color: typeIndex == index ? white : black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

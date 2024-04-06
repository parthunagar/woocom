import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/const/constant.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class AutoScrollViewWidget extends StatefulWidget {
  // const AutoScrollViewWidget({super.key});

  @override
  State<AutoScrollViewWidget> createState() => _AutoScrollViewWidgetState();
}

class _AutoScrollViewWidgetState extends State<AutoScrollViewWidget> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: imgList
              .map(
                (item) => Container(
                  decoration: BoxDecoration(
                    color: lightBlueOpacity,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Image.asset(item, fit: BoxFit.fill)
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            viewportFraction: 1.0,
            disableCenter: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                print("_current : " + _current.toString());
                print("reason : " + reason.toString());
              });
            },
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 15,
          alignment: Alignment.center,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _current == index ? 10 : 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? lightBlue : ligntBlueText,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 4);
            },
            itemCount: imgList.length,
          ),
        ),
      ],
    );
  }
}

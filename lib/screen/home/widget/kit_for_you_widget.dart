import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/screen/home/widget/build_row_widget.dart';
import 'package:woocom_3_16_9/const/constant.dart';

class KitForYouWidget extends StatefulWidget {
  // const KitForYouWidget({super.key});

  @override
  State<KitForYouWidget> createState() => _KitForYouWidgetState();
}

class _KitForYouWidgetState extends State<KitForYouWidget> {
  // int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRowWidget(
          title: "Kit for you",
          showLeadingIcon: false,
          onTapLeadingIcon: () {},
        ),
        SizedBox(height: 16),
        CarouselSlider(
          items: kitForYouList
              .map(
                (item) => AnimatedContainer(
                  duration: Duration(microseconds: 500),
                  curve: Curves.bounceOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.fill,
                    ),
                    
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            // reverse: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            autoPlayCurve: Curves.easeOut,
            viewportFraction: 1.0,
            disableCenter: true,
            // onPageChanged: (index, reason) {
            //   setState(() {
            //     _current = index;
            //     print("_current : " + _current.toString());
            //     print("reason : " + reason.toString());
            //   });
            // },
          ),
        )
      ],
    );
  }
}

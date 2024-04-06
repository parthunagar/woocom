import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:woocom_3_16_9/theme/colors.dart';

class CustomRatingBar extends StatelessWidget {
  double initialRating;
  double itemSize;

  CustomRatingBar({
    Key? key,
    required this.initialRating,
    required this.itemSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      ratingWidget: RatingWidget(
        empty: Icon(
          Icons.star_border_outlined,
          color: yellow,
        ),
        full: Icon(
          Icons.star_outlined,
          color: yellow,
        ),
        half: Icon(
          Icons.star_half_rounded,
          color: yellow,
        ),
      ),
      ignoreGestures: true,
      onRatingUpdate: (val) {},
      allowHalfRating: true,
      initialRating: initialRating,// index % 2 == 0 ? 3 : 4,
      maxRating: 5,
      itemSize: itemSize,// h * 0.027,
    );
  }
}

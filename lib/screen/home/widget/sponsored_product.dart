import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woocom/Components/custom_rating_bar.dart';
import 'package:woocom/screen/home/widget/build_row_widget.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/utils/app_icon_utils.dart';

class SponsoredProductView extends StatefulWidget {
  @override
  State<SponsoredProductView> createState() => _SponsoredProductViewState();
}

class _SponsoredProductViewState extends State<SponsoredProductView>
    with SingleTickerProviderStateMixin {
  List data = [
    [
      [AppIcon.samsungGalaxyA231, 'Samsung Galaxy A23', 'Electronics', 'USD', '699.99','599.99',2.5],
      [AppIcon.samsungGalaxyA327, 'Samsung Galaxy A32', 'Electronics', 'USD', '379.99','279.99',2.5],
      [AppIcon.samsungGalaxyM232, 'Samsung Galaxy M23', 'Electronics', 'USD', '369.99','269.99',2.5],
    ],
    [
      [AppIcon.samsungGalaxyS21FE1, 'Samsung Galaxy S21 FE', 'Electronics', 'USD', '587.99','487.99',2.5],
      [AppIcon.samsungGalaxyS21Plus1, 'Samsung Galaxy S21 Plus', 'Electronics', 'USD', '1199.99','1299.99',2.5],
      [AppIcon.samsungGalaxyS21Ultra1, 'Samsung Galaxy S21 Ultra', 'Electronics', 'USD', '1299.99','1399.99',2.5],
    ],
    [
      [AppIcon.samsungGalaxyS22Ultra1, 'Samsung Galaxy S22 Ultra', 'Electronics', 'USD', '1399.99','1499.99',2.5],
      [AppIcon.samsungGalaxyS221, 'Samsung Galaxy S22', 'Electronics', 'USD', '609.99.99','709.99.99',2.5],
      [AppIcon.samsungGalaxyZFlip41, 'Samsung Galaxy Z Flip4', 'Electronics', 'USD', '1158.99','1258.99',2.5],
    ],

    /*
    [
      [AppIcon.samsungGalaxyS21FE1, 'Samsung Galaxy S21 FE', 'Electronics', 'USD', '587.99','487.99',2.5],
      [AppIcon.samsungGalaxyS21Plus1, 'Samsung Galaxy S21 Plus', 'Electronics', 'USD', '1199.99','1299.99',2.5],
      [AppIcon.samsungGalaxyS21Ultra1, 'Samsung Galaxy S21 Ultra', 'Electronics', 'USD', '1299.99','1399.99',2.5],
    ],
    [
      [AppIcon.samsungGalaxyS21FE1, 'Samsung Galaxy S21 FE', 'Electronics', 'USD', '587.99','487.99',2.5],
      [AppIcon.samsungGalaxyS21Plus1, 'Samsung Galaxy S21 Plus', 'Electronics', 'USD', '1199.99','1299.99',2.5],
      [AppIcon.samsungGalaxyS21Ultra1, 'Samsung Galaxy S21 Ultra', 'Electronics', 'USD', '1299.99','1399.99',2.5],
    ],
    [
      [AppIcon.samsungGalaxyS21FE1, 'Samsung Galaxy S21 FE', 'Electronics', 'USD', '587.99','487.99',2.5],
      [AppIcon.samsungGalaxyS21Plus1, 'Samsung Galaxy S21 Plus', 'Electronics', 'USD', '1199.99','1299.99',2.5],
      [AppIcon.samsungGalaxyS21Ultra1, 'Samsung Galaxy S21 Ultra', 'Electronics', 'USD', '1299.99','1399.99',2.5],
    ],
    */
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRowWidget(
          title: "Sponsored Products",
          showLeadingIcon: false,
        ),
        SizedBox(height: 16),
        Container(
          height: 290,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1.565,
                children: List<Widget>.generate(
                  data.length,
                  (i) {
                    return i % 2 == 0
                        ? _ParentWidget(
                            parentIcon: data[i][0][0],// AppIcon.samsungGalaxyA231,
                            parentTitle: data[i][0][1],//'Samsung Galaxy A23',
                            parentCategory: data[i][0][2],
                            parentCurrency: '${data[i][0][3]} ',
                            parentMRP: data[i][0][4],
                            parentPrice: '${data[i][0][5]} ',
                            initialRating: data[i][0][6],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              _ChildWidget(
                                childIcon: AppIcon.samsungGalaxyA327,
                                childTitle: 'Samsung Galaxy A32',
                                childCategory: 'Electronics',
                                childMRP: '379.99',
                                childPrice: '279.99 ',
                                childCurrency: 'USD ',
                                initialRating: 2.5,
                              ),
                              _ChildWidget(
                                childIcon: AppIcon.samsungGalaxyM232,
                                childTitle: 'Samsung Galaxy M23',
                                childCategory: 'Electronics',
                                childMRP: '369.99',
                                childPrice: '269.99 ',
                                childCurrency: 'USD ',
                                initialRating: 2.5,
                              ),
                            ],
                          );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ChildWidget extends StatelessWidget {
  final String childIcon,
      childTitle,
      childCategory,
      childMRP,
      childPrice,
      childCurrency;
  final double initialRating;

  const _ChildWidget({
    Key? key,
    required this.childIcon,
    required this.childTitle,
    required this.childCategory,
    required this.childMRP,
    required this.childPrice,
    required this.childCurrency,
    required this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightBlueOpacity),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Image.asset(childIcon),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                childTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
              ),
              Text(
                childCategory,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: grey,
                    ),
              ),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: childPrice,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                    ),
                    TextSpan(
                      text: childCurrency,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: black,
                            fontSize: 10,
                          ),
                    ),
                    TextSpan(
                      text: childMRP,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: red,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ParentWidget extends StatelessWidget {
  final String parentIcon,
      parentTitle,
      parentCategory,
      parentMRP,
      parentPrice,
      parentCurrency;
  final double initialRating;

  const _ParentWidget({
    Key? key,
    required this.parentIcon,
    required this.parentTitle,
    required this.parentCategory,
    required this.parentMRP,
    required this.parentPrice,
    required this.parentCurrency,
    required this.initialRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightBlueOpacity),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Image.asset(
              parentIcon,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parentTitle,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
              ),
              Text(
                parentCategory,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: grey,
                    ),
              ),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: parentPrice,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    TextSpan(
                      text: parentCurrency,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: black),
                    ),
                    TextSpan(
                      text: parentMRP,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: red,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                  ],
                ),
              ),
              CustomRatingBar(
                itemSize: 20,
                initialRating: 2.5,
              ),
            ],
          )
        ],
      ),
    );
  }
}

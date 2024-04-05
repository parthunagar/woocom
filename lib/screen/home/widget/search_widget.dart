import 'package:flutter/material.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/theme/colors.dart';
import 'package:woocom/utils/app_icon_utils.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchC = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return TextField(
      onTap: () {
        setState(() {
          Navigator.pushNamed(context, PageRoutes.searchProductListScreen);
          FocusScope.of(context).unfocus();
        });
      },
      controller: searchC,
      onSubmitted: (value) {},
      onChanged: (value) {
        print("value : " + value.toString());
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: greyLight.withOpacity(0.01),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Container(
            padding: EdgeInsets.all(14.0),
            child: Image.asset(
              AppIcon.search,
              height: h * 0.02,
            ),
          ),
          border: InputBorder.none,
          hintText: 'Search products...'),
    );
  }
}

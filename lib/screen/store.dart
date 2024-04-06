import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Components/Arguments/screen_arguments.dart';
import 'package:woocom_3_16_9/Components/Simmer/shimmer_StoreList.dart';
import 'package:woocom_3_16_9/Routes/routes.dart';
import 'package:woocom_3_16_9/const/fontFamily_list.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:woocom_3_16_9/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool showData = false;

  Timer? timer;

  Future getData() async {
    timer = Timer(
      Duration(seconds: 2),
      () {
        if (this.mounted) {
          setState(() {
            showData = true;
          });
        }
      },
    );
    // setState(() {});
    return showData;
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  List storeList = [
    [AppIcon.brandApple, 'Apple'],
    [AppIcon.brandAsus, 'Asus'],
    [AppIcon.brandDell, 'Dell'],
    [AppIcon.brandGoogle, 'Google'],
    [AppIcon.brandGoPro, 'GoPro'],
    [AppIcon.brandHuawei, 'Huawei'],
    [AppIcon.brandIWatch, 'IWatch'],
    [AppIcon.brandLenovo, 'Lenovo'],
    [AppIcon.brandLg, 'LG'],
    [AppIcon.brandLouisVuitton, 'Louis Vuitton'],
    [AppIcon.brandOnePlus, 'OnePlus'],
    [AppIcon.brandSamsung, 'Samsung'],
    [AppIcon.brandXiaomi2, 'Xiaomi'],
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return showData == false
              ? ShimmerStoreList()
              : GridView.builder(
                  itemCount: storeList.length, // 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.7),
                    crossAxisSpacing: w * 0.04, // horizontal space
                    mainAxisSpacing: h * 0.01, // vertical space
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _ListItem(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PageRoutes.categoryWiseList,
                          arguments: ScreenArguments(
                            storeList[index]
                                [1], //index % 2 == 0 ? 'Fabrics' : 'Bags',
                          ),
                        );
                      },
                      icon: storeList[index]
                          [0], // index % 2 == 0 ? AppIcon.bag10 : AppIcon.bag9,
                      title: storeList[index]
                          [1], //index % 2 == 0 ? 'Fabrics' : 'Bags',
                    );
                  },
                );
        },
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  String icon, title;
  void Function()? onTap;
  _ListItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: h * 0.19,
            width: double.infinity,
            decoration: BoxDecoration(
              color: white, // lightBlue.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: lightBlue,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Image.asset(
                icon,
                // fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: h * 0.01),
          Text(
            title,
            style: TextStyle(
              fontFamily: futuraLightBt,
              fontSize: 16,
              color: black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

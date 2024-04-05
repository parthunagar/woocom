import 'package:flutter/material.dart';
import 'package:woocom/Components/drawer_swipe.dart';
import 'package:woocom/Routes/routes.dart';
import 'package:woocom/const/fontFamily_list.dart';
import 'package:woocom/utils/app_icon_utils.dart';
import 'package:woocom/screen/cart.dart';
import 'package:woocom/screen/drawer.dart';
import 'package:woocom/screen/home/home.dart';
import 'package:woocom/screen/setting.dart';
import 'package:woocom/screen/store.dart';
import 'package:woocom/theme/colors.dart';

class DashBoardScreen extends StatefulWidget {
  int? selectedindex;

  DashBoardScreen({this.selectedindex = 0});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  var drawerKey = GlobalKey<SwipeDrawerState>();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: grey,
      extendBodyBehindAppBar: true,
      body: SwipeDrawer(
        radius: 15,
        key: drawerKey,
        hasClone: true,
        bodyBackgroundPeekSize: 20,
        backgroundColor: lightBlue,
        drawer: buildDrawer(context),
        child: Column(
          children: [
            AppBar(
              title: Text(
                widget.selectedindex == 0
                    ? 'WooCom'
                    : widget.selectedindex == 1
                        ? "WooCom Store"
                        : widget.selectedindex == 2
                            ? "WooCom Cart"
                            : "WooCom Setting",
                style: TextStyle(
                  color: lightBlue,
                  fontFamily: futuraHeavyFont,
                ),
              ),
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  if (drawerKey.currentState!.isOpened()) {
                    drawerKey.currentState!.closeDrawer();
                  } else {
                    drawerKey.currentState!.openDrawer();
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(17),
                  child: Image.asset(
                    AppIcon.sideMenu,
                  ),
                ),
              ),
              actions: [
                Container(
                  // color: red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, PageRoutes.notificationListScreen);
                          },
                    child: Stack(
                      children: [
                        // IconButton(
                        //   onPressed: () {},
                        //   // padding: EdgeInsets.zero,
                        //   icon: Icon(
                        //     Icons.notifications_none,
                        //     color: lightBlue,
                        //   ),
                        // ),
                        Icon(
                          Icons.notifications_none,
                          color: lightBlue,
                          size: 30,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: lightBlue,
                              shape: BoxShape.circle,
                              // border: Border.all(color: lightBlue),
                            ),
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '1',
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: white,
                                        fontSize: 8,
                                      ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: white,
                child: navigateScreen(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: white,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                onTap: (value) {
                  print("value : " + value.toString());
                  setState(() {
                    widget.selectedindex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.selectedindex == 0
                              ? AppIcon.fillHome
                              : AppIcon.fillOutHome,
                          height: h * 0.03,
                        ),
                        SizedBox(height: h * 0.01),
                        widget.selectedindex == 0
                            ? Image.asset(
                                AppIcon.ellipseYellow,
                                height: h * 0.005,
                              )
                            : Offstage(),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.selectedindex == 1
                              ? AppIcon.fillStore
                              : AppIcon.fillOutStore,
                          height: h * 0.03,
                        ),
                        SizedBox(height: h * 0.01),
                        widget.selectedindex == 1
                            ? Image.asset(
                                AppIcon.ellipseYellow,
                                height: h * 0.005,
                              )
                            : Offstage(),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.selectedindex == 2
                              ? AppIcon.fillShoppingCart
                              : AppIcon.fillOutShoppingCart,
                          height: h * 0.03,
                        ),
                        SizedBox(height: h * 0.01),
                        widget.selectedindex == 2
                            ? Image.asset(
                                AppIcon.ellipseYellow,
                                height: h * 0.005,
                              )
                            : Offstage(),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.selectedindex == 3
                              ? AppIcon.fillSetting
                              : AppIcon.fillOutSetting,
                          height: h * 0.03,
                        ),
                        SizedBox(height: h * 0.01),
                        widget.selectedindex == 3
                            ? Image.asset(AppIcon.ellipseYellow,
                                height: h * 0.005)
                            : Offstage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  navigateScreen() {
    print("BOTTOM NAVIGATION INDEX : " + widget.selectedindex.toString());
    if (widget.selectedindex == 1) {
      return StoreScreen();
    } else if (widget.selectedindex == 2) {
      return CartScreen();
    } else if (widget.selectedindex == 3) {
      return SettingScreen();
    } else {
      return HomeScreen();
    }
  }
}

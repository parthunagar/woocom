import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woocom_3_16_9/screen/home/widget/build_row_widget.dart';
import 'package:woocom_3_16_9/utils/app_icon_utils.dart';
import 'package:vector_math/vector_math_64.dart' as v;

class SurprisedForFriendView extends StatefulWidget {
  @override
  State<SurprisedForFriendView> createState() => _SurprisedForFriendViewState();
}

class _SurprisedForFriendViewState extends State<SurprisedForFriendView>
    with SingleTickerProviderStateMixin {
  List data = [
    [AppIcon.multipleBox1, 1, 1, Colors.red, BoxFit.contain],
    [AppIcon.multipleBox2, 2, 2, Colors.amber, BoxFit.contain],
    [AppIcon.multipleBox3, 1, 1, Colors.black, BoxFit.contain],
    [AppIcon.multipleBox4, 1, 1, Colors.blueAccent, BoxFit.contain],
    [AppIcon.multipleBox5, 1, 1, Colors.cyan, BoxFit.contain],
    [AppIcon.multipleBox6, 2, 2, Colors.deepOrange, BoxFit.contain],
    [AppIcon.multipleBox8, 1, 1, Colors.deepPurple, BoxFit.contain],
    [AppIcon.singleGift4, 1, 1, Colors.cyanAccent, BoxFit.contain],
    [AppIcon.multipleBox7, 2, 1, Colors.brown, BoxFit.fitWidth],
    [AppIcon.multipleBox9, 2, 1, Colors.green, BoxFit.fitWidth],
    [AppIcon.multipleBox10, 2, 2, Colors.deepPurpleAccent, BoxFit.contain],
    [AppIcon.multipleBox11, 1, 1, Colors.indigo, BoxFit.contain],
    [AppIcon.singleGift2, 1, 1, Colors.blueAccent, BoxFit.contain],
    [AppIcon.multipleBox12, 2, 2, Colors.lime, BoxFit.contain],
    [AppIcon.multipleBox13, 1, 1, Colors.orangeAccent, BoxFit.contain],
    [AppIcon.singleGift3, 1, 1, Colors.pinkAccent, BoxFit.contain],
    [AppIcon.multipleBox14, 2, 1, Colors.pink, BoxFit.fitWidth],
    [AppIcon.multipleBox15, 2, 2, Colors.purple, BoxFit.fill],
    [AppIcon.multipleBox16, 1, 1, Colors.teal, BoxFit.contain],
    [AppIcon.multipleBox17, 1, 1, Colors.yellow, BoxFit.contain],
    [AppIcon.multipleBox18, 2, 2, Colors.lightBlueAccent, BoxFit.contain],
    [AppIcon.multipleBox19, 1, 1, Colors.indigoAccent, BoxFit.cover],
    [AppIcon.singleGift1, 1, 1, Colors.redAccent, BoxFit.contain],
  ];

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  int? getCurrentIndex(int val) {
    setState(() {
      currentIndex = val;
      if (_controller.isCompleted) {
        _controller.reverse();
        // _controller.repeat();
      } else {
        _controller.forward();
      }
    });
    return currentIndex;
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildRowWidget(
          title: "Surprised for a Friend",
          showLeadingIcon: false,
        ),
        SizedBox(height: 16),
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: data.asMap().entries.map(
            (entry) {
              return StaggeredGridTile.count(
                crossAxisCellCount: entry.value[1],
                mainAxisCellCount: entry.value[2],
                child: AnimatedContainer(
                  duration: Duration(seconds: 5),
                  child: GestureDetector(
                    onPanStart: (value) => getCurrentIndex(entry.key),
                    onPanEnd: (value) => getCurrentIndex(entry.key),
                    onPanDown: (value) => getCurrentIndex(entry.key),
                    onPanUpdate: (value) => getCurrentIndex(entry.key),
                    child: currentIndex == entry.key
                        ? Container(
                            decoration: BoxDecoration(
                              color: entry.value[3],
                            ),
                            child: Transform(
                              alignment: FractionalOffset.center,
                              transform: v.Matrix4.diagonal3(
                                v.Vector3(
                                  _animation.value,
                                  _animation.value,
                                  _animation.value,
                                ),
                              ),
                              child: Image.asset(
                                entry.value[0],
                                fit: entry.value[4],
                              ),
                            ),
                          )
                        : Container(
                            color: entry.value[3],
                            child: Image.asset(
                              entry.value[0],
                              fit: entry.value[4],
                            ),
                          ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

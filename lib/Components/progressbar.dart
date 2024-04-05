import 'package:flutter/material.dart';
import 'package:woocom/theme/colors.dart';

class ProgressBarIndicator extends StatefulWidget {
  @override
  _ProgressBarIndicatorState createState() => _ProgressBarIndicatorState();
}

class _ProgressBarIndicatorState extends State<ProgressBarIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(lightBlue),
        ),
      ),
    );
  }
}

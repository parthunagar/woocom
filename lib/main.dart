import 'package:flutter/material.dart';
import 'package:woocom_3_16_9/Routes/routes.dart';

import 'package:woocom_3_16_9/screen/Auth/signin.dart';
import 'package:woocom_3_16_9/theme/style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: SignInScreen(),
      routes: PageRoutes().routes(),
    );
  }
}

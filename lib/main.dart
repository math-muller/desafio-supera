import 'package:desafio_supera/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:desafio_supera/pages/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 300),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'bindings/bindings.dart';
import 'pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => SplashPage(),
          binding: SplashBinding(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding(),
          transition: Transition.fade,
          transitionDuration: Duration(seconds: 1),
        ),
        GetPage(
          name: '/checkout',
          page: () => CheckoutPage(),
        ),
      ],
    );
  }
}

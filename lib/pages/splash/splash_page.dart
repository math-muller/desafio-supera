import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.store, size: 100),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

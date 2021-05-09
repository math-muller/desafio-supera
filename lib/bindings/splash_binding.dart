import 'package:get/get.dart';

import '../controller/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

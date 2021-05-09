import 'package:get/get.dart';

import '../controller/controller.dart';
import '../repository/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepository>(HomeRepository());
    Get.put(HomeController(Get.find()));
  }
}

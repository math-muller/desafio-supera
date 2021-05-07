import 'package:desafio_supera/controller/home_controller.dart';
import 'package:desafio_supera/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepository>(HomeRepository());
    Get.put(HomeController(Get.find()));
  }
}

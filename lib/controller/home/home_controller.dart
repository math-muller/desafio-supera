import 'package:desafio_supera/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final repository = HomeRepository();

  @override
  void onInit() {
    super.onInit();
    findProducts();
  }

  Future<void> findProducts() async {
    change([], status: RxStatus.loading());
    try {
      final data = await repository.getProducts();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao buscar Usuários'));
    }
  }
}

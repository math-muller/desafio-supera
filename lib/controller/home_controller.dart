import 'package:desafio_supera/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository _repository;
  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    findProducts();
  }

  Future<void> findProducts() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _repository.getProducts();
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao carregar produtos'));
    }
  }
}

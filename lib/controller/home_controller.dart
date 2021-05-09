import 'package:desafio_supera/models/products_model.dart';
import 'package:desafio_supera/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository _repository;
  List<ProductsModel> cartItens = [];
  double _total = 0;
  double _subtotal = 0;
  int _frete = 0;

  double get total => _total;
  double get subtotal => _subtotal;
  int get frete => _frete;

  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    findProducts();
  }

  void calcSubtotal() {
    _subtotal =
        cartItens.fold(0, (prevVal, product) => prevVal + product.price);
  }

  void calcTotal() {
    if (cartItens.isEmpty) {
      _total = 0;
    } else {
      _total = _subtotal + _frete;
    }
  }

  void calcFrete() {
    _frete = _subtotal > 250 ? 0 : cartItens.length * 10;
  }

  void globalCalc() {
    calcSubtotal();
    calcTotal();
    calcFrete();
    update(['cart']);
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

  void addProductToCart(ProductsModel product) {
    cartItens.add(product);
  }

  void removeProductToCart(ProductsModel product) {
    cartItens.remove(product);
  }

  //Future<void> filteredByHigherPrice() async {}

  //Future<void> filteredByLowerPrice() {}

  //Future<void> filteredByScore() {}

  // Future<void> filteredByAlphabeticalOrder() {}

  void goToCheckout() {
    Get.toNamed('/checkout');
  }
}

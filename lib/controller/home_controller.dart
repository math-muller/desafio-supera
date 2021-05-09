import 'package:get/get.dart';

import '../models/models.dart';
import '../repository/repository.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository _repository;
  List<ProductsModel> cartItems = [];
  String _filter = 'Filtrar';
  double _total = 0;
  double _subtotal = 0;
  int _frete = 0;
  int _itemsCart = 0;

  double get total => _total;
  double get subtotal => _subtotal;
  int get frete => _frete;
  int get itemsCart => _itemsCart;
  String get filter => _filter;

  HomeController(this._repository);

  @override
  void onInit() {
    super.onInit();
    findProducts();
  }

  void loadFilter(String value) {
    _filter = value;
    findProducts();
  }

  void calcSubtotal() {
    _subtotal =
        cartItems.fold(0, (prevVal, product) => prevVal + product.price);
  }

  void calcTotal() {
    if (cartItems.isEmpty) {
      _total = 0;
    } else {
      _total = _subtotal + _frete;
    }
  }

  void calcFrete() {
    _frete = _subtotal > 250 ? 0 : cartItems.length * 10;
  }

  void calc() {
    _itemsCart = cartItems.length;
    calcSubtotal();
    calcTotal();
    calcFrete();
    update(['cart']);
  }

  Future<void> findProducts() async {
    change([], status: RxStatus.loading());
    try {
      final data = await _repository.getProducts();
      if (_filter.contains('Ord. Alfabética')) {
        data.sort((a, b) => a.name.compareTo(b.name));
      } else if (_filter.contains('Menor Valor')) {
        data.sort((a, b) => a.price.compareTo(b.price));
      } else if (_filter.contains('Maior Valor')) {
        data.sort((a, b) => b.price.compareTo(a.price));
      } else if (_filter.contains('Popularidade')) {
        data.sort((a, b) => b.score.compareTo(a.score));
      }
      change(data, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao carregar produtos'));
    }
  }

  void addProductToCart(ProductsModel product) {
    cartItems.add(product);
  }

  void removeProductToCart(ProductsModel product) {
    cartItems.remove(product);
  }

  //Future<void> filteredByHigherPrice() async {}

  //Future<void> filteredByLowerPrice() {}

  //Future<void> filteredByScore() {}

  // Future<void> filteredByAlphabeticalOrder() {}

  void goToCheckout() {
    Get.toNamed('/checkout');
  }
}

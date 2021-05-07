import 'package:desafio_supera/models/products_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  static String path = "assets/database/products.json";

  Future<ProductsModel> getProducts() async {
    final response = await rootBundle.loadString(path);
    final product = ProductsModel.fromJson(response);
    return product;
  }
}

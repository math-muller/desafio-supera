import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/models.dart';

class HomeRepository {
  static String path = "assets/database/products.json";

  Future<List<ProductsModel>> getProducts() async {
    try {
      final response = await rootBundle.loadString(path);
      final list = jsonDecode(response) as List;
      final products = list.map((e) => ProductsModel.fromMap(e)).toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}

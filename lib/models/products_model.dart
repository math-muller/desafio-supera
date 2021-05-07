import 'dart:convert';

class ProductsModel {
  final int id;
  final String name;
  final double price;
  final int score;
  final String image;

  ProductsModel({
    required this.id,
    required this.name,
    required this.price,
    required this.score,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'score': score,
      'image': image,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      score: map['score'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String src) =>
      ProductsModel.fromMap(json.decode(src));
}

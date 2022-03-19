import 'package:meta/meta.dart';
import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.categoryName,

    required this.categoryImage,
    required this.numberOfProducts,
  });

  final int id;
  final String categoryName;
  final String categoryImage;
  final int numberOfProducts;

  //factory Category.fromJson(String str) => Category.fromJson(json.decode(str));
  //String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    numberOfProducts: json["number_of_products"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
    "category_image": categoryImage,
    "number_of_products": numberOfProducts,
  };
}

import 'package:meta/meta.dart';
import 'dart:convert';

class Category {
  Category({
    required this.id,
    required this.categoryName,
    // required this.applicationId,
    required this.categoryImage,
   // required this.categoryIcon,
   // required this.parentId,
   //  required this.sortOrder,
   //  required this.lastModified,
   //  required this.categorySlug,
   //  required this.categoryStatus,
   //  required this.createdAt,
   //  required this.updatedAt,
     required this.numberOfProducts,
  });

  final int id;
  final String categoryName;
  //final String applicationId;
  final String categoryImage;
  // final dynamic categoryIcon;
  // final String parentId;
  // final dynamic sortOrder;
  // final dynamic lastModified;
  // final dynamic categorySlug;
  // final String categoryStatus;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final int numberOfProducts;

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    categoryName: json["category_name"],
  //  applicationId: json["application_id"],
    categoryImage: json["category_image"],
    // categoryIcon: json["category_icon"],
    // parentId: json["parent_id"],
    // sortOrder: json["sort_order"],
    // lastModified: json["last_modified"],
    // categorySlug: json["category_slug"],
    // categoryStatus: json["category_status"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    numberOfProducts: json["number_of_products"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_name": categoryName,
   // "application_id": applicationId,
    "category_image": categoryImage,
    // "category_icon": categoryIcon,
    // "parent_id": parentId,
    // "sort_order": sortOrder,
    // "last_modified": lastModified,
    // "category_slug": categorySlug,
    // "category_status": categoryStatus,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    "number_of_products": numberOfProducts,
  };
}

import 'package:meta/meta.dart';
import 'dart:convert';

class Products {
  Products({
    required this.id,
    //required this.applicationId,
    required this.shopCategoryId,
    required this.productQuantity,
    //required this.productModel,
    required this.productImage,
    //required this.productVideoLink,
    required this.productPrice,
    // required this.productLastModified,
    // required this.productDateAvailable,
    // required this.productWeight,
    // required this.productWeightUnit,
    // required this.productStatus,
    // required this.productMinOrder,
    required this.productDesc,
    // required this.createdAt,
    // required this.updatedAt,
    // required this.shopProductAttributes,
    required this.shopProductImages,
    required this.shopCategory,
  });

  final int id;
  //final String applicationId;
  final String shopCategoryId;
  final dynamic productQuantity;
  //final String productModel;
  final String productImage;
  //final dynamic productVideoLink;
  final String productPrice;
  // final dynamic productLastModified;
  // final dynamic productDateAvailable;
  // final dynamic productWeight;
  // final dynamic productWeightUnit;
  // final dynamic productStatus;
  // final String productMinOrder;
  final String productDesc;
  //final DateTime createdAt;
  //final DateTime updatedAt;
  //final List<dynamic> shopProductAttributes;
  final List<dynamic> shopProductImages;
  final ShopCategory shopCategory;

  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    //applicationId: json["application_id"],
    shopCategoryId: json["shop_category_id"],
    productQuantity: json["product_quantity"],
    //productModel: json["product_model"],
    productImage: json["product_image"],
    //productVideoLink: json["product_video_link"],
    productPrice: json["product_price"],
    //productLastModified: json["product_last_modified"],
    //productDateAvailable: json["product_date_available"],
    //productWeight: json["product_weight"],
    //productWeightUnit: json["product_weight_unit"],
    //productStatus: json["product_status"],
    //productMinOrder: json["product_min_order"],
    productDesc: json["product_desc"],
    //createdAt: DateTime.parse(json["created_at"]),
    //updatedAt: DateTime.parse(json["updated_at"]),
    //shopProductAttributes: List<dynamic>.from(json["shop_product_attributes"].map((x) => x)),
    shopProductImages: List<dynamic>.from(json["shop_product_images"].map((x) => x)),
    shopCategory: ShopCategory.fromJson(json["shop_category"]),
  );

   Map<String, dynamic> toJson() => {
//     "id": id,
//     "application_id": applicationId,
//     "shop_category_id": shopCategoryId,
//     "product_quantity": productQuantity,
//     "product_model": productModel,
//     "product_image": productImage,
//     "product_video_link": productVideoLink,
//     "product_price": productPrice,
//     "product_last_modified": productLastModified,
//     "product_date_available": productDateAvailable,
//     "product_weight": productWeight,
//     "product_weight_unit": productWeightUnit,
//     "product_status": productStatus,
//     "product_min_order": productMinOrder,
//     "product_desc": productDesc,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "shop_product_attributes": List<dynamic>.from(shopProductAttributes.map((x) => x)),
//     "shop_product_images": List<dynamic>.from(shopProductImages.map((x) => x)),
//     "shop_category": shopCategory.toJson(),
   };
 }

class ShopCategory {
  ShopCategory({
    required this.id,
    required this.categoryName,
    //required this.applicationId,
    required this.categoryImage,
    //required this.categoryIcon,
    // required this.parentId,
    // required this.sortOrder,
    // required this.lastModified,
    // required this.categorySlug,
    // required this.categoryStatus,
    // required this.createdAt,
    // required this.updatedAt,
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

  factory ShopCategory.fromRawJson(String str) => ShopCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShopCategory.fromJson(Map<String, dynamic> json) => ShopCategory(
    id: json["id"],
    categoryName: json["category_name"],
   // applicationId: json["application_id"],
    categoryImage: json["category_image"],
    // categoryIcon: json["category_icon"],
    // parentId: json["parent_id"],
    // sortOrder: json["sort_order"],
    // lastModified: json["last_modified"],
    // categorySlug: json["category_slug"],
    // categoryStatus: json["category_status"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

   Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "category_name": categoryName,
  //   "application_id": applicationId,
  //   "category_image": categoryImage,
  //   "category_icon": categoryIcon,
  //   "parent_id": parentId,
  //   "sort_order": sortOrder,
  //   "last_modified": lastModified,
  //   "category_slug": categorySlug,
  //   "category_status": categoryStatus,
  //   "created_at": createdAt.toIso8601String(),
  //   "updated_at": updatedAt.toIso8601String(),
  };
}

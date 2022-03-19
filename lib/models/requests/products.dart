class Products {
  Products({
    required this.productModel,
    required this.id,
             this.shopCategoryId,
    required this.productQuantity,
    required this.productImage,
    required this.productPrice,
    required this.productDesc,
    required this.shopProductImages,
    required this.shopCategory,
  });

  final int id;
  final String ? shopCategoryId;
  final dynamic productQuantity;
  final String productImage;
  final String productPrice;
  final String productModel;
  final String productDesc;
  final List<dynamic> shopProductImages;
  final ShopCategory shopCategory;

  //  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));
  //String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    shopCategoryId: json["shop_category_id"],
    productQuantity: json["product_quantity"],
    productImage: json["product_image"],
    productPrice: json["product_price"],
    productDesc: json["product_desc"],
    shopProductImages: List<dynamic>.from(json["shop_product_images"].map((x) => x)),
    shopCategory: ShopCategory.fromJson(json["shop_category"]),
    productModel: json["product_model"],
  );
 }

class ShopCategory {
  ShopCategory({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
  });
  final int id;
  final String categoryName;
  final String categoryImage;
  // factory ShopCategory.fromRawJson(String str) => ShopCategory.fromJson(json.decode(str));
  // String toRawJson() => json.encode(toJson());
  factory ShopCategory.fromJson(Map<String, dynamic> json) =>
      ShopCategory(
        id: json["id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
      );
}
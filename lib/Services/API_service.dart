import 'dart:convert';
//import 'dart:io';
import 'package:blue_fc_store/models/requests/category.dart';
import 'package:blue_fc_store/models/requests/products-list.dart';
import 'package:blue_fc_store/models/requests/products.dart';
import 'package:http/http.dart'as http;

class APIService {
 static const String baseUrl = 'http://api.maydan.club/api/mobile/al-hilal-saudi-fc/';
// http://api.maydan.club/api/mobile/al-hilal-saudi-fc/login

 Future<List<Products>> getProduct(String url) async {
   late List<Products> productData ;
  try {
   http.Response response = await http.get(Uri.parse(baseUrl + url));
   if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    ProductsList productsList = ProductsList.fromJson(jsonData);
      productData = productsList.productsList.map((e) => Products.fromJson(e)).toList();
   }
   else {
    print('Status code : ${response.statusCode}');
   }
  }
  catch (e) {
   print(e);
  }
  return productData ;
 }
  Future<List<Category>> getCategory(String url) async {
   List<Category> data = [];
   try {
    http.Response response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
     var jsonData = jsonDecode(response.body);
     List<dynamic> categories = jsonData['data'];

     for (Map<String, dynamic> category in categories) {
      Category categoryData = Category.fromJson(category);
      // print(productData.productDesc);
      data.add(categoryData);
     }
    }
    else {
     print('Status code : ${response.statusCode}');
    }
   }
   catch (e) {
    print(e);
   }
   return data;
  }

  Future<http.Response> post(String url, dynamic bodyMap,[Map<String,String>? headers] ) {
   return http.post(Uri.parse(baseUrl + url), body: jsonEncode(bodyMap),headers: headers
   // HttpHeaders.contentTypeHeader:'application/json; charset=UTF-8'
   );
  }
 }

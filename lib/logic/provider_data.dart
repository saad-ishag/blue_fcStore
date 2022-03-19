
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Services/API_service.dart';
import '../models/requests/products.dart';
class ProviderData extends ChangeNotifier {
   List <Products> _productList = [];
   int amount = 1 ;

 Future<void> getProduct()async{
    APIService apiService =APIService();
      _productList = await apiService.getProduct('products');
    notifyListeners ();
  }

  List<Products> get productList  {
     return  _productList;
   }
   void increment(){
   amount ++ ;
   notifyListeners();
   }
   void decrement(){
     if (amount!=0){
        amount -- ;
     }
     notifyListeners();
   }

   void changeCarouselSlider(){

   }




}
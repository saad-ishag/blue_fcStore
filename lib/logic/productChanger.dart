
import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../models/local_product.dart';

class ProductChanger extends ChangeNotifier{

  ProductsType selectedProduct = ProductsType.shoes;
  int itemNumber = LocalProducts.shoes.length;

  int? respondCode;

  List<LocalProducts> productCategory = LocalProducts.shoes;


  void changeToCapsProducts(){
    productCategory = LocalProducts.caps;
    itemNumber = LocalProducts.caps.length;
    selectedProduct = ProductsType.caps;
    notifyListeners();
  }
  void changeToShoesProducts(){
    itemNumber = LocalProducts.shoes.length;
    productCategory = LocalProducts.shoes;
    selectedProduct = ProductsType.shoes;


    notifyListeners();
  }

  void changeToShirtProducts(){
    itemNumber = 3 ;
    selectedProduct = ProductsType.shirts;

    notifyListeners();

  }

  void changeToTrousersProducts(){
    productCategory = LocalProducts.trousers;
    itemNumber = LocalProducts.trousers.length;
    selectedProduct = ProductsType.trainings;
    notifyListeners();
  }






}
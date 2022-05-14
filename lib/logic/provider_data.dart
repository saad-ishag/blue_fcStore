
import 'package:blue_fc_store/Screens/product_screen.dart';
import 'package:blue_fc_store/Screens/tools/bought_product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Screens/profile_screen.dart';
import '../Screens/store_screen.dart';
import '../Services/API_service.dart';
import '../models/requests/products.dart';
class ProviderData extends ChangeNotifier {

  int navBarCurrentIndex = 0;
  final navBarScreens = [const ProfileScreen(),const StoreScreen()];
  bool showSpinner = false ;

  int carouselSliderIndex = 0 ;

  List <BoughtProduct> boughtProducts = [];

  double totalAmount(int amount){

    double sum = 0 ;
    for( BoughtProduct product in boughtProducts){
      double priceAsDouble = double.parse(product.productPrice);
      sum = sum + (priceAsDouble*amount);
    }
    print(sum);

    return sum ;

  }


  List <Products> _productList = [];
  static bool loading = false ;
  int amount = 0 ;
  int index = 0 ;
  bool getProductError = false;
  bool _isFavorite = false;
  bool get isFavorite =>_isFavorite;

  void toggleIsFavorite(){
    _isFavorite=!_isFavorite;
    notifyListeners();
  }



  void changeNavBar(int index){
    navBarCurrentIndex = index ;
    notifyListeners();
  }

 Future<void> getProduct()async{

      APIService apiService = APIService();
      _productList = await apiService.getProduct('products').catchError((e){
        getProductError=true;
      });
      notifyListeners();

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
        notifyListeners();
     }
     notifyListeners();
   }

   void changeCarouselSlider(int index){

      notifyListeners();
   }
   addProduct(BoughtProduct product){
   boughtProducts.add(product);
   notifyListeners();
   }
   removeProduct(BoughtProduct product){
   boughtProducts.remove(product);
   notifyListeners();
   }

}
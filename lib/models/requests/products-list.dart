class ProductsList{
 final List<dynamic> productsList ;

 ProductsList({required this.productsList});

 factory ProductsList.fromJson(Map<String,dynamic> json)=>ProductsList(productsList: json['data']);



}
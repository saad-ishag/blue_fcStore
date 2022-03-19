import 'package:flutter/cupertino.dart';

class  LocalProducts {

  final Image image ;
  final String name ;
  final int    price ;

  LocalProducts({required this.image, required this.name,  required this.price});

  static List <LocalProducts> shoes = [
     LocalProducts(image: Image.asset('images/1.jpg',fit: BoxFit.cover,), name: 'Black Adidas shoes', price: 700),
     LocalProducts(image: Image.asset('images/4.jpg',fit: BoxFit.cover,), name: 'Grey & Blue shoes', price: 600),
     LocalProducts(image: Image.asset('images/2.jpg',fit: BoxFit.cover,), name: 'Royal Blue tennis shoes', price: 800),
     LocalProducts(image: Image.asset('images/nike.jpg',fit: BoxFit.cover,),name: 'Nike White & grey FLY.By', price: 650),
  ];

  static List <LocalProducts> caps = [
    LocalProducts(image: Image.asset('images/6.jpg',fit: BoxFit.cover,), name: 'Black Cap',  price: 200),
    LocalProducts(image: Image.asset('images/7.jpg',fit: BoxFit.cover,), name: 'Blue Cap',  price: 150),
    LocalProducts(image: Image.asset('images/8.jpg',fit: BoxFit.cover,), name: 'Sport Cap',  price: 250),
  ];

  static List <LocalProducts> trousers = [
    LocalProducts(image: Image.asset('images/tr.jpg',fit: BoxFit.cover,), name: 'W&H training ',  price: 500),
    LocalProducts(image: Image.asset('images/tr2.jpg',fit: BoxFit.cover,), name: 'black training',  price: 550),
    LocalProducts(image: Image.asset('images/kk.jpg',fit: BoxFit.cover), name: 'Red Basketball Short', price: 400),
    LocalProducts(image: Image.asset('images/44.jpg',fit: BoxFit.cover), name: 'Gey Short', price: 300),
    LocalProducts(image: Image.asset('images/22.webp',fit: BoxFit.cover), name: 'lightGreen Short', price: 350),
    LocalProducts(image: Image.asset('images/li.jpeg',fit: BoxFit.cover), name: 'Blue Training Sport', price: 450),
  ];


}

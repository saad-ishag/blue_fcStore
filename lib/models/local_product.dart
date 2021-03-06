import 'package:flutter/cupertino.dart';

class  LocalProducts {

  final Image image ;
  final String name ;
  final int    price ;

  LocalProducts({required this.image, required this.name,  required this.price});

  static List <LocalProducts> shoes = [
    LocalProducts(image: Image.asset('images/nike.jpg'),name: 'Nike White & grey FLY.By', price: 650),
    LocalProducts(image: Image.asset('images/1.jpg'), name: 'Black Adidas shoes', price: 700),
    LocalProducts(image: Image.asset('images/4.jpg'), name: 'Grey & Blue shoes', price: 600),
    LocalProducts(image: Image.asset('images/2.jpg'), name: 'Royal Blue tennis shoes', price: 800),
  ];

  static List <LocalProducts> caps = [
    LocalProducts(image: Image.asset('images/6.jpg'), name: 'Black Cap',  price: 200),
    LocalProducts(image: Image.asset('images/7.jpg'), name: 'Blue Cap',  price: 150),
    LocalProducts(image: Image.asset('images/8.jpg'), name: 'Sport Cap',  price: 250),
  ];

  static List <LocalProducts> trousers = [
    LocalProducts(image: Image.asset('images/tr.jpg'), name: 'W&H training ',  price: 500),
    LocalProducts(image: Image.asset('images/tr2.jpg'), name: 'black training',  price: 550),
    LocalProducts(image: Image.asset('images/kk.jpg'), name: 'Red Basketball Short', price: 400),
    LocalProducts(image: Image.asset('images/44.jpg'), name: 'Grey Short', price: 300),
    LocalProducts(image: Image.asset('images/22.webp'), name: 'lightGreen Short', price: 350),
    LocalProducts(image: Image.asset('images/li.jpeg'), name: 'Blue Training Sport', price: 450),
  ];
}
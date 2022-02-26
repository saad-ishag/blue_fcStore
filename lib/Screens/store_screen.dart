import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:badges/badges.dart';

import 'pay_screen.dart';
import 'product_screen.dart';
import 'tools/basic_product.dart';


enum ProductsType { caps, shirts, accessories, shoes }

const Color kSelectedColor = Color(0xff2779AB);
const Color kUnSelectedColor = Color(0xffE9E9E9);

class StoreScreen extends StatefulWidget {
  static const String id = 'Store Screen';

  const StoreScreen({Key? key}) : super(key: key);
  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  ProductsType selectedProduct = ProductsType.shoes;
  int itemNumber = 10 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Opacity(
                    child: SizedBox(
                      width: 25,
                    ),
                    opacity: 0,
                  ),
                  SizedBox(
                      child: Image.asset(
                    'images/Chelsea_logo.png',
                    width: 40,
                    height: 40,
                  )),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, PayScreen.id);
                    },
                    child: Badge(
                      position: BadgePosition.topEnd(),
                      badgeContent: Text('5',style: TextStyle(color: Colors.white,fontSize: 12),),
                      badgeColor: Color(0xff499CC6),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 25,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Products(
                      text: 'كابات',
                      onPress: () {
                        setState(() {
                          itemNumber =1 ;
                          selectedProduct = ProductsType.caps;
                        });
                      },
                      colour: selectedProduct == ProductsType.caps
                          ? kSelectedColor
                          : kUnSelectedColor,
                      textColor: selectedProduct == ProductsType.caps ? Colors.white : Colors.black,
                    ),
                    Products(
                      text: 'اكسسوارات',
                      onPress: () {
                        setState(() {
                          itemNumber= 2;
                          selectedProduct = ProductsType.accessories;
                        });
                      },
                      colour: selectedProduct == ProductsType.accessories
                          ? kSelectedColor
                          : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.accessories ? Colors.white : Colors.black
                    ),
                    Products(
                      text: 'الأقمصة',
                      onPress: () {
                        setState(() {
                          selectedProduct = ProductsType.shirts;
                          itemNumber =5 ;
                        });
                      },
                      colour: selectedProduct == ProductsType.shirts
                          ? kSelectedColor
                          : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.shirts ? Colors.white : Colors.black
                    ),
                    Products(
                        text: 'الأحذية',
                        onPress: () {
                          setState(
                            () {
                              selectedProduct = ProductsType.shoes;
                              itemNumber= 10 ;
                            },
                          );
                        },
                        colour: selectedProduct == ProductsType.shoes
                            ? kSelectedColor
                            : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.shoes ? Colors.white : Colors.black ,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: StaggeredGrid(itemCount: itemNumber,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid({
    Key? key, required this.itemCount,
  }) : super(key: key);
  final int itemCount ;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: itemCount,
      itemBuilder: (context, index) => InkWell(
        child: buildImageCard(index),
        onTap: () {
          Navigator.pushNamed(context, ProductScreen.id);
        },
      ),
    );
  }
}

Widget buildImageCard(index) {
  return Card(
    shadowColor: Colors.black,
    elevation: 3,
    // margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            child: Image.network(
              'https://source.unsplash.com/random?sig=$index',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Adidas Shoe',
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),
          const Text(
            '\$١٢٥',
            style:
                // ignore: unnecessary_const
                TextStyle(fontSize: 12, color:  Color(0xff499CC6)),
          ),
        ],
      ),
    ),
  );
}
Widget buildCard(String imageUrl ,String productName ,String productPrice ) {
  return Card(
    shadowColor: Colors.black,
    elevation: 3,
    // margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            productName,
            style: TextStyle(fontSize: 15, color: Colors.grey[600]),
          ),
           Text(
            '\$ $productPrice',
            style:
            // ignore: unnecessary_const
            const TextStyle(fontSize: 12, color: Color(0xff499CC6)),
          ),
        ],
      ),
    ),
  );
}





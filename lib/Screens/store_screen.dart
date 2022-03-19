import 'package:blue_fc_store/Screens/tools/local_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:badges/badges.dart';
import '../logic/provider_data.dart';
import 'pay_screen.dart';
import 'product_screen.dart';
import 'tools/basic_product.dart';
import 'package:provider/provider.dart';

enum ProductsType { caps, shirts, trainings, shoes }

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
  int  itemNumber = 3 ;
  int? respondCode ;
  List<LocalProducts> productCategory = LocalProducts.shoes;



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
                    BasicProducts(
                      text: 'كابات',
                      onPress: () {
                        setState(() {
                          productCategory = LocalProducts.caps ;
                          itemNumber =LocalProducts.caps.length ;
                          selectedProduct = ProductsType.caps;
                        });
                      },
                      colour: selectedProduct == ProductsType.caps
                          ? kSelectedColor
                          : kUnSelectedColor,
                      textColor: selectedProduct == ProductsType.caps ? Colors.white : Colors.black,
                    ),
                    BasicProducts(
                      text: 'بناطلين',
                      onPress: () {
                        setState(() {
                          productCategory = LocalProducts.trousers;
                          itemNumber =  LocalProducts.trousers.length;
                          selectedProduct = ProductsType.trainings;
                        });
                      },
                      colour: selectedProduct == ProductsType.trainings
                          ? kSelectedColor
                          : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.trainings ? Colors.white : Colors.black
                    ),
                    BasicProducts(
                      text: 'الأقمصة',
                      onPress: () {
                        itemNumber = Provider.of<ProviderData>(context,listen: false).productList.length;

                        setState(() {
                          selectedProduct = ProductsType.shirts;
                        });
                      },
                      colour: selectedProduct == ProductsType.shirts
                          ? kSelectedColor
                          : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.shirts ? Colors.white : Colors.black
                    ),
                    BasicProducts(
                        text: 'الأحذية',
                        onPress: () {
                          setState(
                            () {
                              itemNumber = LocalProducts.shoes.length;
                              productCategory =LocalProducts.shoes;
                              selectedProduct = ProductsType.shoes;
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
                child: staggeredView(itemNumber,productCategory),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget staggeredView (int itemCount,List <LocalProducts>productCategory) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: itemCount,
      itemBuilder: (context, index) => InkWell(
        child:
        selectedProduct == ProductsType.shirts ?
         buildNetworkImageCard(index) : buildLocalImageCard(index,productCategory) ,
        onTap: () {
          Navigator.pushNamed(context, ProductScreen.id,arguments: {
            'productImage': Provider.of<ProviderData>(context,listen: false).productList[index].productImage,
            'productName' : Provider.of<ProviderData>(context,listen: false).productList[index].productModel ,
            'productPrice': Provider.of<ProviderData>(context,listen: false).productList[index].productPrice,
            'index'       : index ,

          });
        },
      ),
    );
  }

  Widget buildLocalImageCard(index,List<LocalProducts> productCategory) {
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
              child:productCategory[index].image,
            ),
            Text(
              productCategory[index].name,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
             Text(
              '\$${productCategory[index].price}',
              style:
              // ignore: unnecessary_const
              const TextStyle(fontSize: 12, color:  Color(0xff499CC6)),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildNetworkImageCard(index) {
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
                Provider.of<ProviderData>(context).productList[index].productImage,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              Provider.of<ProviderData>(context).productList[index].productModel,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '\$ ${Provider.of<ProviderData>(context).productList[index].productPrice}',
              style:
              // ignore: unnecessary_const
              const TextStyle(fontSize: 12, color: Color(0xff499CC6)),
            ),
          ],
        ),
      ),
    );
  }
}





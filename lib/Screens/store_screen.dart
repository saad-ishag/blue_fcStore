import 'package:blue_fc_store/logic/productChanger.dart';
import 'package:blue_fc_store/models/local_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:badges/badges.dart';
import '../constants.dart';
import '../logic/provider_data.dart';
import 'local_product_screen.dart';
import 'pay_screen.dart';
import 'product_screen.dart';
import 'tools/product_types.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class StoreScreen extends StatefulWidget {
  static const String id = 'Store Screen';

  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {getProducts();});

   // getProducts();

    super.initState();
  }
  void getProducts()async{
    await Provider.of<ProviderData>(context,listen: false).getProduct();
  }

  @override
  Widget build(BuildContext context) {

    ProductsType selectedProduct = context.watch<ProductChanger>().selectedProduct;
    int itemNumber = context.watch<ProductChanger>().itemNumber;
    List<LocalProducts> productCategory = context.watch<ProductChanger>().productCategory;

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
                    onTap: () {
                      Navigator.pushNamed(context, PayScreen.id);
                    },
                    child: Badge(
                      position: BadgePosition.topEnd(),
                      badgeContent: Text(
                        '${Provider.of<ProviderData>(context).boughtProducts.length}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      badgeColor: const Color(0xff499CC6),
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
                    ProductTypes(
                      text: 'كابات',
                      onPress: () {
                        context.read<ProductChanger>().changeToCapsProducts();
                      },
                      colour: selectedProduct == ProductsType.caps
                          ? kSelectedColor
                          : kUnSelectedColor,
                      textColor: selectedProduct == ProductsType.caps
                          ? Colors.white
                          : Colors.black,
                    ),
                    ProductTypes(
                        text: 'بناطلين',
                        onPress: () {
                          context.read<ProductChanger>().changeToTrousersProducts();
                        },
                        colour: selectedProduct == ProductsType.trainings
                            ? kSelectedColor
                            : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.trainings
                            ? Colors.white
                            : Colors.black),
                    ProductTypes(
                        text: 'الأقمصة',
                        onPress: () async {

                         //  TODO why the next line gives me error if i used it
                          //(error invalid index range )
                          //Provider.of<ProviderData>(context, listen: false).productList.length-1;

                          context.read<ProductChanger>().changeToShirtProducts();

                        },
                        colour: selectedProduct == ProductsType.shirts
                            ? kSelectedColor
                            : kUnSelectedColor,
                        textColor: selectedProduct == ProductsType.shirts
                            ? Colors.white
                            : Colors.black),
                    ProductTypes(
                      text: 'الأحذية',
                      onPress: () {
                        context.read<ProductChanger>().changeToShoesProducts();
                      },
                      colour: selectedProduct == ProductsType.shoes
                          ? kSelectedColor
                          : kUnSelectedColor,
                      textColor: selectedProduct == ProductsType.shoes
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: staggeredView(itemNumber, productCategory),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget staggeredView(int itemCount, List<LocalProducts> productCategory) {
    return StaggeredGridView.countBuilder(
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: itemCount,
      itemBuilder: (context, index) => InkWell(
        child: context.read<ProductChanger>().selectedProduct == ProductsType.shirts
            ? buildNetworkImageCard(index)
            : buildLocalImageCard(index, productCategory),
        onTap: () {
          context.read<ProductChanger>().selectedProduct == ProductsType.shirts
              ? Navigator.pushNamed(context, ProductScreen.id, arguments: {
                  'productImage':
                      Provider.of<ProviderData>(context, listen: false)
                          .productList[index]
                          .productImage,
                  'productName':
                      Provider.of<ProviderData>(context, listen: false)
                          .productList[index]
                          .productModel,
                  'productPrice':
                      Provider.of<ProviderData>(context, listen: false)
                          .productList[index]
                          .productPrice,
                  'index': index,
                })
              : Navigator.pushNamed(context, LocalProductScreen.id, arguments: {
                  'productCategory': productCategory,
                  'index': index,
                });
        },
      ),
    );
  }

  Widget buildLocalImageCard(index, List<LocalProducts> productCategory) {
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
              child: productCategory[index].image,
            ),
            Text(
              productCategory[index].name,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            Text(
              '\$${productCategory[index].price}',
              style:
                  // ignore: unnecessary_const
                  const TextStyle(fontSize: 12, color: Color(0xff499CC6)),
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
        child: context.watch<ProviderData>().getProductError?
        const Center(child: SizedBox(
          height: 90,
            width: 90,
            child: Icon(Icons.error,color: Colors.red,size: 50,)))
            :Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              child: Stack(
                children: [
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.lightBlueAccent,
                  )),
                  FadeInImage.memoryNetwork(
                    fadeInDuration: const Duration(milliseconds: 500),
                    placeholder: kTransparentImage,
                    image: Provider.of<ProviderData>(context)
                        .productList[index]
                        .productImage,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Text(
              Provider.of<ProviderData>(context)
                  .productList[index]
                  .productModel,
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

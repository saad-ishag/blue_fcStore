import 'package:blue_fc_store/Screens/tools/bought_product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'tools/rounded_icon.dart';

//TODO fix the amount problem
class ProductScreen extends StatefulWidget {
  static String id = 'productScreen';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map? productData = {};


  final CarouselController _controller = CarouselController();

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProviderData>(context, listen: false);
    productData = ModalRoute.of(context)?.settings.arguments as Map?;
    final List<String> imList = [
      Provider.of<ProviderData>(context)
          .productList[productData!['index']]
          .productImage,
      //two ways to get the same image
      productData!['productImage'],
    ];
    int _current = context.read<ProviderData>().carouselSliderIndex;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            ),
            color: Colors.black87,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 350,
                  width: 300,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        context
                            .read<ProviderData>()
                            .changeCarouselSlider(index);
                      },
                      aspectRatio: 1,
                      viewportFraction: 1,
                    ),
                    items: imList
                        .map(
                          (item) => Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 9.0,
                      height: 9.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff2374A9)
                              .withOpacity(_current == entry.key ? 1 : 0.2)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                productData!['productName'],
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${productData!['productPrice']}\$',
                style: const TextStyle(
                  color: Color(0xff2374A9),
                ),
                textAlign: TextAlign.end,
              ),
              const SizedBox(height: 15),
              Expanded(
                  child: Text(
                Provider.of<ProviderData>(context)
                    .productList[productData!['index']]
                    .productDesc,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });

                        BoughtProduct boughtProduct = BoughtProduct(
                            isLocal: false,
                            amount: 1,
                            productName: productData!['productName'],
                            productPrice: productData!['productPrice'],
                            productImage: productData!['productImage']);
                        isFavorite
                            ? provider.addProduct(boughtProduct)
                            : provider.boughtProducts.contains(boughtProduct)
                                ? provider.removeProduct(boughtProduct)
                                : null;
                      },
                      child: isFavorite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.pink,
                              size: 30,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              size: 30,
                            )),
                  const Text(
                    '?????????? ?????? ?????????? ',
                    style: TextStyle(
                        fontSize: 19,
                        color: Color(0xff2374A9),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.end,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

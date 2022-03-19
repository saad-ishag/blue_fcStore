import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'tools/rounded_icon.dart';

class ProductScreen extends StatefulWidget {
  static String id = 'productScreen';

   ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map ? productData = {} ;
  int _current = 0;
  int amount = 0 ;

  final CarouselController _controller = CarouselController();

  void increment(){
    setState(() {
      amount++ ;
    });
  }

  @override
  Widget build(BuildContext context) {
    productData = ModalRoute.of(context)?.settings.arguments as Map? ;
    final List<String> imList =
    [
      Provider.of<ProviderData>(context).productList[productData!['index']].productImage,
      productData!['productImage'],
    ];
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
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 350,
                      width: 300,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged:  (index, reason) {
                      setState(() {
                      _current = index;
                      });},
                          aspectRatio: 1,
                          viewportFraction: 1,
                        ),
                        items: imList.map((item) => Image.network(item,fit: BoxFit.cover,width: 1000,),).toList(),
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
                      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  const Color(0xff2374A9)
                              .withOpacity(_current == entry.key ? 1 : 0.2)
                      ),
                    ),
                  );
                }).toList(),
              ),
              //TODO some widget here
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
                        Provider.of<ProviderData>(context).productList[productData!['index']].productDesc,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 20,color: Colors.grey),
              )),
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(onPressed:
                        Provider.of<ProviderData>(context).decrement,
                         icon: FontAwesomeIcons.minus,),
                      Text('${Provider.of<ProviderData>(context).amount}'),
                      RoundedButton(icon: Icons.add, onPressed:Provider.of<ProviderData>(context).increment),
                    ],
                  ),
                  const Text(
                    'الكمية',
                    style:
                        TextStyle(fontSize: 19, color: Color(0xff2374A9),fontWeight: FontWeight.bold),
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


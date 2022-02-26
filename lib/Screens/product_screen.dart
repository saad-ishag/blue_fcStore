import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'tools/rounded_icon.dart';

//TODO use the carousel package to slide the product image

class ProductScreen extends StatefulWidget {
  static String id = 'productScreen';

  ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List <String> imList = [
    'https://source.unsplash.com/random?sig=1',
    'https://source.unsplash.com/random?sig=2',
    'https://source.unsplash.com/random?sig=3',
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            ),
            color: Colors.black87,
            onPressed: () {Navigator.pop(context);},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.end,
            children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
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
                        items: imList.map((item) => Container(
                          child: Image.network(item,fit: BoxFit.cover,width: 1000,),
                        ),).toList(),
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
                      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Color(0xff2374A9)
                              .withOpacity(_current == entry.key ? 1 : 0.2)
                      ),
                    ),
                  );
                }).toList(),
              ),
              //TODO some widget here
              SizedBox(
                height: 30,
              ),
              Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '١٥٨,٠٠\$',
                style: TextStyle(
                  color: Color(0xff2374A9),
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 15),
              Expanded(
                  child: Text(
                    'product name product name product name product name '
                    'product name product name product name product name '
                    'product name product name product name product name '
                    'product name product name product name product name '
                    'product name product name product name product name '
                        'product name product name product name product name ',
                style: TextStyle(fontSize: 11,color: Colors.grey),
              )),
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(onPressed: (){}, icon: FontAwesomeIcons.minus,),
                      Text('1'),
                      RoundedButton(icon: Icons.add, onPressed: (){})

                    ],
                  ),
                  Text(
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


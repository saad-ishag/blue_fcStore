import 'package:blue_fc_store/Screens/tools/rounded_icon.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO need to review and change this class

import 'package:provider/provider.dart';
class BoughtProduct extends StatefulWidget {
    BoughtProduct({
    Key? key, required this.amount, required this.productName, required this.productPrice, this.productImage, this.localProductImage, required this.isLocal,// required this.number,
  }) : super(key: key);
        int amount ;
  final String productName ;
  final String productPrice ;
  final String? productImage;
  final Image? localProductImage ;
  final bool isLocal ;

  @override
  State<BoughtProduct> createState() => _BoughtProductState();
}

class _BoughtProductState extends State<BoughtProduct> {
  void increment(){
    setState(() {
      widget.amount ++;
    });}
  void decrement (){
    if (widget.amount!=0){
      setState(() {
        widget.amount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    String totalPrice = (double.parse(widget.productPrice)*(widget.amount)).toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Divider(
          height: 15,
          color: Colors.grey,
        ),
        SizedBox(height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName,textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
                  //Text(productName,textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedButton(onPressed: (){
                            decrement();
                            print(totalPrice);
                            }, icon: FontAwesomeIcons.minus,),
                          Text('${widget.amount}'),
                          RoundedButton(onPressed: (){increment();
                          print(totalPrice);},icon: Icons.add,)
                        ],
                      ),
                       Padding(
                        padding: const EdgeInsets.only(left: 38),
                        child: Text('${totalPrice}\$',style: const TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
                  )],
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: SizedBox(
                  height: 110,
                  width: 150,
                    child:widget.isLocal ? widget.localProductImage : Image.network(widget.productImage!),
                ),
              ),],
          ),),
      ],
    );
  }
}

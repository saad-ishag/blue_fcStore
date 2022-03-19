import 'package:blue_fc_store/Screens/tools/rounded_icon.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class BoughtProduct extends StatelessWidget {
  const BoughtProduct({
    Key? key, required this.amount, this.onPlusPress, this.onMinusPress,// required this.number,
  }) : super(key: key);
  final int amount ;
  final dynamic onPlusPress;
  final dynamic onMinusPress;

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Nike Men White & grey FLY.By',textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
                  Text('LOW Basketball Shoes',textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedButton(onPressed: onMinusPress, icon: FontAwesomeIcons.minus,),
                          Text('$amount'),
                          RoundedButton(icon: Icons.add, onPressed: onPlusPress),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 38),
                        child: Text('\$1300',style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
                  )],
              ),
              Image.asset('images/nike.jpg')
            ],
          ),),
      ],
    );
  }
}

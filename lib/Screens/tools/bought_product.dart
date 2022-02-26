import 'package:blue_fc_store/Screens/tools/rounded_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BoughtProduct extends StatelessWidget {
  const BoughtProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Nike Men White & Blue FLY.By',textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
              Text('LOW Basketball Shoes',textAlign: TextAlign.end,style: TextStyle(color: Colors.grey[700]),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(onPressed: (){}, icon: FontAwesomeIcons.minus,),
                      Text('2'),
                      RoundedButton(icon: Icons.add, onPressed: (){}),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Text('\$1300',style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              )],
          ),
          Image.asset('images/nike.jpg')
        ],
      ),);
  }
}

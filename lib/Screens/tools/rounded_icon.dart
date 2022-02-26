import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {

  final IconData icon ;
  final Function onPressed ;

  const RoundedButton({Key? key, required this.icon,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 26.0,
        height: 26.0,
      ),
      fillColor: Color(0xff2374A9),
      shape: CircleBorder(),
      elevation: 0.0,
      child: Icon(icon,size: 16,color: Colors.white,),
      onPressed: (){onPressed;},
    );
  }
}

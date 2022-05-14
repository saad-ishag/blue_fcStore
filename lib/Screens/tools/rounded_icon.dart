import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {

  final IconData icon ;
  final Function onPressed ;

   const RoundedButton({Key? key, required this.icon,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 26.0,
        height: 26.0,
      ),
      fillColor: const Color(0xff2374A9),
      shape: const CircleBorder(),
      elevation: 0.0,
      child: Icon(icon,size: 16,color: Colors.white,),
      onPressed:() {
        onPressed();
        //when using onPressed as Function it doesn't work ??
        // the whole idea is the parenthesis after the function name ( functionName(); )
      }
    );
  }
}

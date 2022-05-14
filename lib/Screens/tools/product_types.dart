import 'package:flutter/material.dart';
class ProductTypes extends StatelessWidget {
  final String text ;
  final Function onPress ;
  final Color colour ;
  final Color textColor ;


   const ProductTypes({Key? key, required this.text,required this.onPress,required this.colour,required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 3),
      child: Material(
        elevation: 0.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: FittedBox(
          child: MaterialButton(
            onPressed: (){
              onPress();
            },
            minWidth: 70.0,
            height: 25.0,
            textColor: Colors.white,
            disabledTextColor: Colors.black,
            child: Text(
              text,
              style:  TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

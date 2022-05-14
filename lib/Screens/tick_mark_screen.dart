
import 'dart:io';

import 'package:animated_check/animated_check.dart';
import 'package:flutter/material.dart';

 class TickMark extends StatefulWidget {
   const TickMark({Key? key}) : super(key: key);

  @override
  _TickMarkState createState() => _TickMarkState();
}

class _TickMarkState extends State<TickMark> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutCirc));
    _animationController.forward();
    pop();
  }

  void pop()async{
   await Future.delayed(const Duration(seconds: 2));
   Navigator.pop(context);
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedCheck(
          color: Colors.lightGreen,
          progress: _animation,
          size: 300,
        ),
      ),
    );
  }
}

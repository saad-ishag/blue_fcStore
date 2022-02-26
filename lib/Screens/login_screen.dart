import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import '../main_page.dart';


class LoginScreen extends StatelessWidget {
  static String id = 'loginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 200,bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                child: Image.asset('images/Chelsea_logo.png'),
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 70),
              const Text('تسجيل الدخول',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              const SizedBox(
                height: 20,
              ),
              TextField(

                decoration: kTextFieldDecoration.copyWith(hintText: 'رقم الهاتف'),
                textAlign: TextAlign.end,
                maxLength: 10,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: kTextFieldDecoration.copyWith(hintText: 'كلمة السر'),
                textAlign: TextAlign.end,
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap:(){ Navigator.pushNamed(context, MainPage.id);},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xff94C0D9), Color(0xff0F5D99)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(32)),
                  child: const Center(
                    child:  Text(
                      'تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  InkWell(
                    child: Text(' تسجيل حساب ',style: TextStyle(color: Colors.blue,fontSize: 15),textAlign: TextAlign.center,),
                    onTap:null ),

                 Text(' ليس لديك حساب ؟ ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),textAlign: TextAlign.center),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

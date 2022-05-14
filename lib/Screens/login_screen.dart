import 'package:blue_fc_store/Screens/signUp-screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../constants.dart';
import '../logic/auth.dart';
import '../main_page.dart';


class LoginScreen extends StatelessWidget {
  static String id = 'loginScreen';


  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    TextEditingController phoneNumber = TextEditingController();
    TextEditingController password = TextEditingController();


    Auth auth =Auth();
    return ModalProgressHUD(
      inAsyncCall: context.watch<Auth>().loading,
      child: Scaffold(
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
                  controller: phoneNumber,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'رقم الهاتف'),
                  textAlign: TextAlign.end,
                  maxLength: 10,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: password,
                  decoration: kTextFieldDecoration.copyWith(hintText: 'كلمة السر'),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap:()async{
                    //TODO check the userModel and the things i have commented it
                    //
                    // context.read<Auth>().changeLoadingState();
                    // await auth.loginTheUser(phoneNumber: phoneNumber.text, password: password.text);
                    // final authResult = context.read<Auth>().loginResult;
                    // context.read<Auth>().changeLoadingState();
                    // if (authResult!.responseCode == 0) {
                    //   await Alert(
                    //       context: context,
                    //       title: "حدث خطأ",
                    //       desc: authResult.responseMessage)
                    //       .show();
                    // } else if (context.read<Auth>().loginResult?.responseCode ==
                    //     1) {
                    //   Navigator.pushNamed(context, MainPage.id);
                    // }},
                    Navigator.pushNamed(context, MainPage.id);},
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
                  children:  [
                    InkWell(
                      child: const Text(' تسجيل حساب ',style: TextStyle(color: Colors.blue,fontSize: 15),textAlign: TextAlign.center,),
                      onTap:(){
                        Navigator.pushNamed(context, SignUpScreen.id);
                      }),

                   const Text(' ليس لديك حساب ؟ ',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),textAlign: TextAlign.center),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

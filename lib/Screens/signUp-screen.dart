
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../logic/auth.dart';
import '../main_page.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const String id = 'signup screen';

  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController passwordConfirmation = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[100],
      body: ModalProgressHUD(
        inAsyncCall: context.watch<Auth>().loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: userName,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    ': اسم المستخدم',
                    style: TextStyle(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: password,
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(': كلمة السر ')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      controller: passwordConfirmation,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    ': تأكيد كلمة السر ',
                    style: TextStyle(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    ': البريد الالكتروني ',
                    style: TextStyle(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: phoneNumber,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    ': رقم الجوال ',
                    style: TextStyle(),
                  )
                ],
              ),
              GestureDetector(
                onTap: () async {
                  context.read<Auth>().changeLoadingState();
                  await context.read<Auth>().signupTheUser(
                        phoneNumber: phoneNumber.text,
                        userName: userName.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirmation.text,
                        email: email.text,
                      );
                  final authResult = context.read<Auth>().signupResult;

                  context.read<Auth>().changeLoadingState();
                  // maybe the problem is that iam not using  headers in the request
                  //no ,although it wired in the console but it actually work
                  if (authResult!.responseCode == 0) {
                    await Alert(
                            context: context,
                            title: "حدث خطأ",
                            desc: authResult.responseMessage)
                        .show();
                  } else if (context.read<Auth>().signupResult?.responseCode ==
                      1) {
                    Navigator.pushNamed(context, MainPage.id);
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xff94C0D9), Color(0xff0F5D99)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(32)),
                  child: const Center(
                    child: Text(
                      'تسجيل الحساب',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

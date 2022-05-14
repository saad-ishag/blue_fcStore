import 'package:blue_fc_store/Screens/local_product_screen.dart';
import 'package:blue_fc_store/Screens/profile_screen.dart';
import 'package:blue_fc_store/logic/productChanger.dart';
import 'package:blue_fc_store/logic/provider_data.dart';
import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';
import 'Screens/product_screen.dart';
import 'Screens/signUp-screen.dart';
import 'Screens/store_screen.dart';
import 'logic/auth.dart';
import 'main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Screens/pay_screen.dart';

// the icons in the home screen
//TODO the amount issue
//TODO the math and logic in the payment screen
//TODO the authentication and the sign up screen
//TODO the gallery access to change the photo and the name of the user

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderData()),
        ChangeNotifierProvider(create: (_) => ProductChanger()),
        ChangeNotifierProvider(create: (_) => Auth()),


      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1600),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          SignUpScreen.id :(context)=> SignUpScreen(),
          MainPage.id: (context) => const MainPage(),
          ProfileScreen.id: (context) => const ProfileScreen(),
          PayScreen.id: (context) =>  const PayScreen(),
          StoreScreen.id: (context) => const StoreScreen(),
          ProductScreen.id: (context) => const ProductScreen(),
          LocalProductScreen.id :(context)=>const LocalProductScreen(),


        },
        initialRoute: LoginScreen.id,
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
    );
  }
}
// when i want to rebuild the screen as a result of some event i should use context.watch
// when i want some functionality (like something should happen after on press) .... context.read
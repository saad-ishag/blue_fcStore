import 'package:blue_fc_store/logic/provider_data.dart';
import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';
import 'Screens/product_screen.dart';
import 'Screens/store_screen.dart';
import 'main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Screens/pay_screen.dart';

// the carousel package
// the navigation bar
//the provider package
//the scroll view color in the store screen
// the icons in the home screen

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderData()),
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
          LoginScreen.id: (context) => LoginScreen(),
          MainPage.id: (context) => const MainPage(),
          PayScreen.id: (context) =>  PayScreen(),
          StoreScreen.id: (context) => const StoreScreen(),
          ProductScreen.id: (context) => ProductScreen(),
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

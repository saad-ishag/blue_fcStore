import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/profile_screen.dart';
import 'Screens/store_screen.dart';


class MainPage extends StatefulWidget {
  static const String id = 'home screen';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final screens = [ProfileScreen(),StoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.lightBlueAccent[500],
        unselectedItemColor: Color(0xff3A4269).withOpacity(.8),
        elevation: 3,
        onTap: (index){
          setState(() {
            currentIndex = index ;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: ''),
        ],
      ),
    );
  }
}

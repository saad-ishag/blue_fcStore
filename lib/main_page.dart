import 'package:flutter/material.dart';
import 'Screens/profile_screen.dart';
import 'Screens/store_screen.dart';
import 'package:provider/provider.dart';
import 'logic/provider_data.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MainPage extends StatelessWidget {
  static const String id = 'home screen';
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentIndex =context.watch<ProviderData>().navBarCurrentIndex;
        //Provider.of<ProviderData>(context).navBarCurrentIndex;
    final screens = context.watch<ProviderData>().navBarScreens;
        //Provider.of<ProviderData>(context).navBarScreens;
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
          children:screens,
          index:currentIndex,

      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.lightBlueAccent[500],
        unselectedItemColor: const Color(0xff3A4269).withOpacity(.8),
        elevation: 3,
        onTap: (index)async{
          Provider.of<ProviderData>(context,listen: false).changeNavBar(index);
          //context.read<ProviderData>().changeNavBar(index);
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

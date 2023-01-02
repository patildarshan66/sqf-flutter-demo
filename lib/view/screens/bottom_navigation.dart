import 'package:flutter/material.dart';
import 'package:sqlf_demo/view/screens/address_list_screen.dart';

import 'cart_screen.dart';
import 'explore_screen.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.black
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            selectedIndex = index;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
          ],
        ),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    switch(selectedIndex){
      case 1:
        return const ExploreScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const AddressListScreen();
      case 0:
      default:
        return const HomeScreen();
    }
  }
}

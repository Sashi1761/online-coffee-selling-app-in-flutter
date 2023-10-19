import 'package:coffeeapp/cart_page.dart';
import 'package:coffeeapp/components/bottom_nav_bar.dart';
import 'package:coffeeapp/const.dart';
import 'package:coffeeapp/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //navigate bottom bar
  int _selectedIndex = 0;
  void navigateBottomBar (int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }


  final List<Widget> _pages = [

    //shop page
          ShopPage(),

    //cart page
    CartPage(),




  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar:MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index)
      ) ,
      body:_pages[_selectedIndex] ,
    );
  }
}
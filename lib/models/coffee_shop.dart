import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier
{
  //coffee for sale list

  final List<Coffee> _shop = [
  //black coffee

  Coffee(
    name: 'Black Coffee',
    price:'Rs 25',
    imagespath:'lib/images/blackcoffee.jpg',

    ),



  //latte

 Coffee(
    name: 'Latte',
    price:'Rs 50',
    imagespath:'lib/images/latte.png',

    ),



  //espresso

   Coffee(
    name: 'Espresso',
    price:'Rs 95',
    imagespath:'lib/images/espresso.jpg',

    ),



  //iced coffee
   Coffee(
    name: 'Iced Coffee',
    price:'Rs 80',
    imagespath:'lib/images/icedcoffee.jpg',

    ),

  ];


  // user cart

  List <Coffee> _userCart = [];



 // get coffee list
  
  List <Coffee> get coffeeShop =>_shop;


     //get user cart
        
    List <Coffee> get userCart=> _userCart;

        //add item to cart

        void addItemToCart (Coffee coffee)
        {
          _userCart.add(coffee);
          notifyListeners();
        }


        //remove item from cart

        void removeItemFromCart(Coffee coffee)
        {
          _userCart.remove(coffee);
          notifyListeners();
        }


}
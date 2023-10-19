import 'package:coffeeapp/components/coffee_tile.dart';
import 'package:coffeeapp/models/coffee.dart';
import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove item from cart
   void removeItem(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
   }

   void payNow()
   {

   }
  @override
  Widget build(BuildContext context) {
    return  Consumer<CoffeeShop>(builder:(context, value, child)=>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text('Your Cart', style: TextStyle(fontSize: 20),
            ),

            //list of cart items
            Expanded(child: ListView.builder(
              itemCount: value.userCart.length,
              itemBuilder: (context, index)
            {
              //get individual coffee
              Coffee eachcoffee = value.userCart[index];

              return CofeeTile(coffee: eachcoffee,
               onPressed: ()=>removeItem(eachcoffee), icon: Icon(Icons.delete));
            },
            ),
            ),

            //pay button

            GestureDetector(
              onTap: payNow,
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                child: Center(child: Text('Pay Now', style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            
          ],
        ),
      ),
    ),);
  }
}
import 'package:coffeeapp/components/coffee_tile.dart';
import 'package:coffeeapp/models/coffee.dart';
import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart 

  void addToCart(Coffee coffee)
  {
    Provider.of<CoffeeShop>(context, listen:false ).addItemToCart(coffee);

    //let user know it's item is added to the cart
     
     showDialog(context: context, builder: (context)=>AlertDialog(
      title:  Text('Successfully Added to Cart'),
     ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(builder: (context,value, child)=>SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //this is the heading
            Text('How would you like your coffee?', style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 25 ),

            //list of coffee to buy

            Expanded(child: ListView.builder(
              itemCount: value.coffeeShop.length,
              itemBuilder: (context, index){
                //get individual coffee
                Coffee eachcoffee = value.coffeeShop[index];
                

                //return the tile
                return CofeeTile(
                  coffee:eachcoffee ,
                  icon: Icon(Icons.add),
                  onPressed: ()=>addToCart(eachcoffee),
                );

              },
              ),
              )
          ],

        ),
      ),

    )
     ,);
  } 
}
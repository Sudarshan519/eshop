
import 'package:eshop/pages/cart.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Cart'),
        elevation: .1,
        centerTitle: true,
        actions: [Icon(Icons.search)],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total'),
                subtitle: Text('\$323'),
              ),
            ),
            Expanded(child:MaterialButton(color:Colors.red,onPressed: (){},child: Text('Check out',style: TextStyle(color: Colors.white),),))
          ],
        ),
      ),
    );
  }
}

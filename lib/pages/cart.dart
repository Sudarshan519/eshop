import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_cart = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing.",
      'size': 'M',
      'color': 'Red',
      'qty': 1
    },
    {
      'name': 'Blazer2',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing.",
      'size': 'M',
      'color': 'Red',
      'qty': 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products_on_cart.length,
      itemBuilder: (BuildContext context, int index) {
        return Single_cart_prod(
          cart_prod_name: products_on_cart[index]['name'],
          cart_prod_size: products_on_cart[index]['size'],
          cart_prod_picture: products_on_cart[index]['picture'],
          cart_prod_price: products_on_cart[index]['price'],
          cart_prod_color: products_on_cart[index]['color'],
          cart_prod_qty: products_on_cart[index]['qty'],
        );
      },
    );
  }
}

class Single_cart_prod extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_old_price;
  final cart_prod_price;
  final cart_prod_desc;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const Single_cart_prod(
      {this.cart_prod_name,
      this.cart_prod_picture,
      this.cart_prod_old_price,
      this.cart_prod_price,
      this.cart_prod_desc,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: Column(
          
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_drop_up,
                ),
                onPressed: () {
                  addQuantity(cart_prod_qty);
                },
              ),
            ),
            Text('$cart_prod_qty'),
            Expanded(
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  addQuantity(cart_prod_qty);
                },
              ),
            ),
          ],
        ),
        leading: Image.asset(
          cart_prod_picture,
          width: 80,
          height: 80,
        ),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Color:'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 12, 5),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }

  int addQuantity(cart_prod_qty) {
    cart_prod_qty = cart_prod_qty + 1;
    return cart_prod_qty;
  }
}

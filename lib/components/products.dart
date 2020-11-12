
import 'package:eshop/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var prod_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing."
    },
   
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: prod_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: prod_list[index]['name'],
          prod_picture: prod_list[index]['picture'],
          prod_old_price: prod_list[index]['old_price'],
          prod_price: prod_list[index]['price'], prod_desc: prod_list[index]['description'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_desc;

  const Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price, this.prod_desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        title: prod_name,
                        price: prod_price,
                        image: prod_picture,
                        oldprice: prod_old_price,
                        desc:prod_desc
                      )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    prod_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    '\$$prod_price',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '\$$prod_old_price',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(prod_picture),
            ),
          ),
        ),
      ),
    );
  }
}

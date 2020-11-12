import 'package:eshop/commons/common.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  final String oldprice;
  final String desc;
  ProductDetails({
    this.title,
    this.image,
    this.price,
    this.oldprice,
    this.desc,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                ),
                Center(
                  child: Image.asset(
                    "images/black.jpg",
                    fit: BoxFit.fill,
                    height: 400,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.07),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.025),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 400,
                      decoration: BoxDecoration(
                        // Box decoration takes a gradient
                        gradient: LinearGradient(
                          // Where the linear gradient begins and ends
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          // Add one stop for each color. Stops should increase from 0 to 1
                          colors: [
                            // Colors are easy thanks to Flutter's Colors class.
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.07),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        ),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container())),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                             ' widget.product.name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '\${widget.product.price / 100}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        changeScreen(context, CartScreen());
                                              },
                                              child: Padding(
                                                  padding: const EdgeInsets.all(4),
                                                  child: Card(
                                                    elevation: 10,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.shopping_cart),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 120,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: () {
                                                print("CLICKED");
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: red,
                                                    borderRadius: BorderRadius.only(
                                                        bottomRight: Radius.circular(35))),
                                                child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(12),
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                                // Container(
                        
                                //  decoration: BoxDecoration(color: Colors.black),
                                //   child: GridTile(
                                //     child: Container(
                                //       color: Colors.white,
                                //       child: Image.asset(widget.image),
                                //     ),
                                //     footer: Container(
                                //       color: Colors.white70,
                                //       child: ListTile(
                                //         leading: Text(
                                //           widget.title,
                                //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                //         ),
                                //         title: Row(
                                //           children: [
                                //             Expanded(
                                //               child: Text(
                                //                 '\{widget.oldprice}',
                                //                 style: TextStyle(
                                //                   decoration: TextDecoration.lineThrough,
                                //                 ),
                                //               ),
                                //             ),
                                //             Expanded(
                                //               child: Text(
                                //                 '\{widget.price}',
                                //                 style: TextStyle(
                                //                     color: Colors.red, fontWeight: FontWeight.bold),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: MaterialButton(
                                //         color: Colors.white,
                                //         textColor: Colors.grey,
                                //         onPressed: () {
                                //           showDialog(
                                //               context: context,
                                //               builder: (context) => AlertDialog(
                                //                     title: Text('Size'),
                                //                     content: Text('Choose Size now'),
                                //                     actions: [
                                //                       MaterialButton(
                                //                         onPressed: () =>
                                //                             Navigator.of(context).pop(context),
                                //                         child: Text('close'),
                                //                       )
                                //                     ],
                                //                   ));
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Expanded(
                                //               child: Text('Size'),
                                //             ),
                                //             Expanded(
                                //               child: Icon(Icons.arrow_drop_down),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: MaterialButton(
                                //         color: Colors.white,
                                //         textColor: Colors.grey,
                                //         onPressed: () {
                                //           showDialog(
                                //               context: context,
                                //               builder: (context) => AlertDialog(
                                //                     title: Text('Color'),
                                //                     content: Text('Choose Color now'),
                                //                     actions: [
                                //                       MaterialButton(
                                //                         onPressed: () =>
                                //                             Navigator.of(context).pop(context),
                                //                         child: Text('close'),
                                //                       )
                                //                     ],
                                //                   ));
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Expanded(
                                //               child: Text('Color'),
                                //             ),
                                //             Expanded(
                                //               child: Icon(Icons.arrow_drop_down),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: MaterialButton(
                                //         color: Colors.white,
                                //         textColor: Colors.grey,
                                //         onPressed: () {
                                //           showDialog(
                                //               context: context,
                                //               builder: (context) => AlertDialog(
                                //                     title: Text('Quantity'),
                                //                     content: Text('Choose Quantity now'),
                                //                     actions: [
                                //                       MaterialButton(
                                //                         onPressed: () =>
                                //                             Navigator.of(context).pop(context),
                                //                         child: Text('close'),
                                //                       )
                                //                     ],
                                //                   ));
                                //         },
                                //         child: Row(
                                //           children: [
                                //             Expanded(
                                //               child: Text('Qty'),
                                //             ),
                                //             Expanded(
                                //               child: Icon(Icons.arrow_drop_down),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     Expanded(
                                //       child: MaterialButton(
                                //         elevation: .2,
                                //         color: Colors.red,
                                //         textColor: Colors.white,
                                //         onPressed: () {},
                                //         child: Text('Buy now'),
                                //       ),
                                //     ),
                                //     IconButton(
                                //       icon: Icon(
                                //         Icons.add_shopping_cart,
                                //         color: Colors.red,
                                //       ),
                                //       onPressed: () {},
                                //     ),
                                //     IconButton(
                                //       icon: Icon(
                                //         Icons.favorite_border,
                                //         color: Colors.red,
                                //       ),
                                //       onPressed: () {},
                                //     ),
                                //   ],
                                // ),
                                // Divider(),
                                // ListTile(title: Text('Product Details'), subtitle: Text(widget.desc)),
                                // Divider(),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "Product Name",
                                //         style: TextStyle(
                                //           color: Colors.grey,
                                //         ),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "uy",
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "Product Brand",
                                //         style: TextStyle(
                                //           color: Colors.grey,
                                //         ),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "X",
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "Product Condition",
                                //         style: TextStyle(
                                //           color: Colors.grey,
                                //         ),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                                //       child: Text(
                                //         "New",
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // Divider(),
                                // Padding(
                                //   padding: EdgeInsets.all(8),
                                //   child: Text('Similar Products'),
                                // ),
                                // Container(
                                //   height: 300,
                                //   child: SimilarProducts(),
                                // )
                              ],
                            ));
                          }
                        
                          Widget CartScreen() {}
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var prod_list = [
    {
      'name': 'Blazer',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing."
    },
    {
      'name': 'Blazer2',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing."
    },
    {
      'name': 'Blazer3',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing."
    },
    {
      'name': 'Blazer4',
      'picture': 'images/products/blazer1.jpeg',
      'old_price': '80',
      'price': '123',
      'description':
          "It usually isn't necessary to provide a widget that pops the Navigator in a route with a Scaffold because the Scaffold automatically adds a 'back' button to its AppBar. Pressing the back button causes Navigator.pop to be called. On Android, pressing the system back button does the same thing."
    }
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
          prod_price: prod_list[index]['price'],
          prod_desc: prod_list[index]['description'],
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
      this.prod_price,
      this.prod_desc});

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
                      desc: prod_desc)));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    'prod_name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Text(
                    '\prod_price',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '\prod_old_price',
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

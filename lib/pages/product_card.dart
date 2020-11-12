import 'package:eshop/commons/common.dart';
import 'package:eshop/pages/product_details.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          
          changeScreen(
              context,
              ProductDetails(
                title: 'dklsj',image: 'images/w1.jpg',
                price:'23',oldprice: '3e4',desc: 'slekjr',
              ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(-2, -1),
                    blurRadius: 5),
              ]),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )),
                      Center(
                        child: Image.asset(
                          '/images/w4.jpeg',
                          fit: BoxFit.cover,
                          height: 140,
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              FittedBox(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '{product.name} \n',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextSpan(
                      text: 'by: {product.brand} \n\n\n\n',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    TextSpan(
                      text: '\${product.price} \t',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      //text: product.sale ? 'ON SALE ' : "",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                  ], style: TextStyle(color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _productImage(String picture) {
    if (picture == null) {
      return Container(
        child: Text('skefi'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'product.picture',
            height: 140,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}

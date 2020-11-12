
import 'package:eshop/pages/product_details.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'Shirt'),
            Category(image_location: 'images/m1.jpeg', image_caption: 'ksle'),
          ],
        ));
  }
}

class Category extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String image_location;
  // ignore: non_constant_identifier_names
  final String image_caption;

  // ignore: non_constant_identifier_names
  Category({this.image_location, this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {
          
        },
        child: Container(
          width: 100,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

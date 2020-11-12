import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Material(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ListTile(
              title: TextFormField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    icon: Icon(Icons.search),
                    border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return "The name field cannot be empty";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color deepOrange = Colors.deepOrange;
Color red = Colors.red;
Color grey = Colors.grey;
Color pink = Colors.pink;
Color black = Colors.black;
Color blue = Colors.blue;
Color white = Colors.white;
Color grey350 = Colors.grey[350];

//methods
void changeScreen(_, Widget widget) {
  Navigator.push(_, MaterialPageRoute(builder: (_) => widget));
}
void changeScreenReplacement(_, Widget widget) {
  Navigator.push(_, MaterialPageRoute(builder: (_) => widget));
}

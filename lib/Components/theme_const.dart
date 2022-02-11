import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

const Color_primary = Colors.teal;
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFF5EEDC),
  appBarTheme: AppBarTheme(backgroundColor: Color_primary),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: Color(0xFFB8405E), fontWeight: FontWeight.bold),
  ),
  
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(backgroundColor: Colors.red),
  textTheme: TextTheme(
    bodyText2:
        TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold),
  ),
);

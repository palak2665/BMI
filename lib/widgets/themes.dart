import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: const Color.fromARGB(255, 255, 217, 176),
      canvasColor: const Color(0xffffeedd),
      cardColor: const Color.fromARGB(255, 251, 228, 202),
      splashColor: const Color.fromARGB(255, 250, 184, 119),
      bottomAppBarColor: const Color(0xff723d46),
      indicatorColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
          subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffffeedd), foregroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        color: Color(0xff723d46),
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      cardColor: Colors.black38,
      canvasColor: const Color(0xff1e1b18),
      splashColor: const Color.fromARGB(255, 54, 54, 54),
      bottomAppBarColor: const Color(0xffeb1555),
      indicatorColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        color: Color(0xff1e1b18),
      ));
}

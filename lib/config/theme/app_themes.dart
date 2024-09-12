import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'PlusJakartaSans',
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black54),
    titleTextStyle: TextStyle(color: Colors.black54, fontSize: 18)
  );
}
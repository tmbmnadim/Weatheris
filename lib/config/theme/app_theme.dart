import 'package:flutter/material.dart';

Color appBackgroundColor = const Color(0xFFFFFFFF); //0xFFccfcfc
Color primaryColor = Colors.cyan;
Color secondaryColor = primaryColor.withOpacity(0.5);


ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: appBackgroundColor,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: primaryColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

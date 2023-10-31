import 'package:flutter/material.dart';

ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffef6c00),
    onPrimary: Color(0xfffff8e1),
    secondary: Color(0xffffab40),
    onSecondary: Color(0xfffff8e1),
    error: Color(0xfffff8e1),
    onError: Color(0xffc62828),
    background: Color(0xfffff8e1),
    onBackground: Color(0xff263238),
    surface: Color(0xfffff8e1),
    onSurface: Color(0xff263238)
);

TextTheme textTheme = ThemeData(fontFamily: "Mulish").textTheme.copyWith(
  displaySmall: TextStyle(
    fontFamily: "Chakra Petch"
  ),
  titleLarge: TextStyle(
    fontFamily: "Chakra Petch",
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.bold
  )
);

ThemeData lightTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: lightScheme,
);

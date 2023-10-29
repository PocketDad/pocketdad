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
    surface: Color(0xffb0bec5),
    onSurface: Color(0xff263238)
);

TextTheme textTheme = ThemeData.light().textTheme;

ThemeData lightTheme = ThemeData(
  fontFamily: 'Mulish',
  colorScheme: lightScheme,
);
import 'package:flutter/material.dart';

ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffef6c00),
    onPrimary: Color(0xfffff8e1),
    secondary: Color(0xffffab40),
    onSecondary: Color(0xffffd180),
    error: Color(0xfffff8e1),
    onError: Color(0xffc62828),
    background: Color(0xfffff8e1),
    onBackground: Color(0xff263238),
    surface: Color(0xfffff8e1),
    onSurface: Color(0xff263238)
);

ColorScheme darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffef6c00),
    onPrimary: Color(0xfffff8e1),
    secondary: Color(0xffffab40),
    onSecondary: Color(0xffffd180),
    error: Color(0xff263238),
    onError: Color(0xffc62828),
    background: Color(0xff263238),
    onBackground: Color(0xfffff8e1),
    surface: Color(0xff263238),
    onSurface: Color(0xfffff8e1)
);

TextTheme textTheme = ThemeData(fontFamily: "Mulish").textTheme.copyWith(
  displaySmall: TextStyle(
    fontFamily: "Chakra Petch",
    fontWeight: FontWeight.bold,
  ),
  displayMedium: TextStyle(
    fontFamily: "Chakra Petch",
    fontWeight: FontWeight.bold,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.bold
  ),
  titleSmall: TextStyle(
    fontStyle: FontStyle.italic
  ),
  titleLarge: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: "Chakra Petch",
  )
);

ThemeData lightTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: lightScheme,
);

ThemeData darkTheme = ThemeData(
  textTheme: textTheme,
  colorScheme: darkScheme,
);

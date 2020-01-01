import 'package:flutter/material.dart';

import 'palette.dart';

class Themes {
  static final ThemeData light = ThemeData(
      accentColor: Palette.accentColor,
      primaryColor: Colors.white,
      primarySwatch: Colors.blue,
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      canvasColor: Colors.grey[50],
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColorBrightness: Brightness.light,
      backgroundColor: Colors.white,
      buttonColor: Palette.accentColor,
      appBarTheme: AppBarTheme(
        elevation: 50.0,
        color: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(title: TextStyle(fontSize: 20.0, color: Colors.white)),
      ),
      fontFamily: 'Manrope',
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));

  static final dark = ThemeData(
      accentColor: Palette.accentColor,
      primaryColor: Colors.black,
      primarySwatch: Colors.blue,
      disabledColor: Colors.grey,
      cardColor: Color(0xff191919),
      canvasColor: Colors.grey[50],
      backgroundColor: Color(0xff191919),
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      buttonColor: Palette.accentColor,
      appBarTheme: AppBarTheme(
        elevation: 50.0,
        iconTheme: IconThemeData(
          color: Colors.white12,
        ),
      ),
      fontFamily: 'Manrope',
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));
}

import 'package:flutter/material.dart';

final ThemeData basicTheme = ThemeData(
  primaryColor: Colors.orange,
  accentColor: Colors.orangeAccent,
  scaffoldBackgroundColor: Colors.white,
  splashColor: Colors.orangeAccent,
  backgroundColor: Colors.white,
  canvasColor: Colors.white,
  //floatingActionButtonTheme: FloatingActionButtonThemeData(),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
);

const TextStyle whiteTextStyle = TextStyle(
  color: Colors.white,
);

const TextStyle accentWhiteTextStyle = TextStyle(
  color: Colors.white30,
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.deepPurple,
  accentColor: Colors.deepPurpleAccent,
  scaffoldBackgroundColor: Colors.black,
  splashColor: Colors.deepPurpleAccent,
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  //floatingActionButtonTheme: FloatingActionButtonThemeData(),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline1: whiteTextStyle,
    headline2: whiteTextStyle,
    headline3: whiteTextStyle,
    headline4: whiteTextStyle,
    headline5: whiteTextStyle,
    headline6: whiteTextStyle,
    subtitle1: whiteTextStyle,
    subtitle2: whiteTextStyle,
    bodyText1: whiteTextStyle,
    bodyText2: whiteTextStyle,
    button: whiteTextStyle,
    caption: whiteTextStyle,
    overline: whiteTextStyle,
  ),
  accentTextTheme: TextTheme(
    headline1: accentWhiteTextStyle,
    headline2: accentWhiteTextStyle,
    headline3: accentWhiteTextStyle,
    headline4: accentWhiteTextStyle,
    headline5: accentWhiteTextStyle,
    headline6: accentWhiteTextStyle,
    subtitle1: accentWhiteTextStyle,
    subtitle2: accentWhiteTextStyle,
    bodyText1: accentWhiteTextStyle,
    bodyText2: accentWhiteTextStyle,
    button: accentWhiteTextStyle,
    caption: accentWhiteTextStyle,
    overline: accentWhiteTextStyle,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  cardTheme: CardTheme(
    color: Colors.black,
  ),
  disabledColor: Colors.white30,
  dialogTheme: DialogTheme(
    backgroundColor: Color.fromARGB(255, 20, 20, 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: accentWhiteTextStyle,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
  ),

);
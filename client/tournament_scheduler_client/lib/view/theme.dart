import 'package:flutter/material.dart';

final ThemeData basicTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.purple,
  accentColor: Colors.purpleAccent,
  colorScheme: ColorScheme.light(),

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
  brightness: Brightness.dark,
  primaryColor: Colors.purple,
  accentColor: Colors.purpleAccent,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  //floatingActionButtonTheme: FloatingActionButtonThemeData(),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  cardTheme: CardTheme(
    color: Colors.black,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Color.fromARGB(255, 20, 20, 20),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: accentWhiteTextStyle,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(),
);
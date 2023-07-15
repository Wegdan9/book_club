import 'package:flutter/material.dart';

class OurTheme {
  Color _lightGreen = Color.fromARGB(255, 213, 235, 220);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkGrey = Color.fromARGB(255, 119, 124, 135);

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _lightGreen,
        primaryColor: _lightGreen,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkGrey,
        hintColor: _lightGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: _lightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: _lightGreen)),
        ),
        // buttonTheme: ButtonThemeData(
        //   buttonColor: _darkGrey,
        //   padding: EdgeInsets.symmetric(horizontal: 30.0),
        //   minWidth: 200,
        //   height: 30.0,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20.0)
        //   )
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_darkGrey),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 30.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(_lightGrey),
          ),
        ));
  }
}

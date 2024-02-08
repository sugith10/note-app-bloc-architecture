import 'package:flutter/material.dart';

final ThemeData vintageTheme = ThemeData(
  primarySwatch: Colors.brown,
  hintColor: Colors.black,
  fontFamily: 'CinzelRegular',
  textTheme: TextTheme(
    
    displayLarge: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.brown[800],
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.brown[800],
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Colors.brown[900],
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.brown[800],
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.brown,
    // textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.brown,
    
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.brown,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cinzel',
        color: Colors.white,
    ),
 
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.brown[100],
  cardTheme: CardTheme(
    color: Colors.brown[200],
  ),
);
 
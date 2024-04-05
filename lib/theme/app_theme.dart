import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.white;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    
    // Color primario
    primaryColor: Colors.lightBlue,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle( color: secondary, fontSize: 20 ), // textColor: primary
    ),

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom( backgroundColor: primary, foregroundColor: secondary)
    ),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
      foregroundColor: secondary
    ),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0,
        foregroundColor: Colors.white
      ),  
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primary ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primary ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide( color: primary ),
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), topRight: Radius.circular(10) )
      ),

    ),

    // Icon button theme
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom( backgroundColor: Colors.transparent, foregroundColor: secondary )
    )



  );






  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    
    // Color primario
    primaryColor: Colors.indigo,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ),

    scaffoldBackgroundColor: Colors.black
    
  );



}
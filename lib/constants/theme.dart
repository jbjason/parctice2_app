import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData darkTheme() => ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.black54,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey, unselectedItemColor: Colors.white),
      );
  static ThemeData lightTheme() => ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        dividerColor: const Color(0xff757575),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white),
      );
}

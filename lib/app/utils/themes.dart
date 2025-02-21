import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  // Define color properties
  static const Color lightPrimaryColor = Colors.deepPurple;
  static const Color darkPrimaryColor = Colors.deepOrange;
  static const Color secondaryColor = Colors.orange;
  static const Color accentColor = Colors.yellow;
  static const Color backgroundColor =
      Color(0xFF4169E1); // Updated to Royal Blue

  // Light theme
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white, // Applied to dashboard
      colorScheme: ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: Colors.deepPurple,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.deepPurple,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.acme(
          color: Colors.white,
          fontSize: 18
        ),
        color: Colors.deepPurple,
        iconTheme: IconThemeData(color: lightPrimaryColor),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.white,
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white));

  // static final ThemeData darkTheme = ThemeData(
  //     scaffoldBackgroundColor: Colors.black45,
  //     colorScheme: ColorScheme.dark(
  //       primary: Colors.white,
  //       secondary: Colors.deepOrange,
  //     ),
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       backgroundColor: Colors.deepOrange,
  //     ),
  //     appBarTheme: AppBarTheme(
  //      titleTextStyle: GoogleFonts.acme(
  //         color: Colors.white,
  //         fontSize: 18
  //       ),
  //       backgroundColor:
  //           Colors.deepOrange, // Changed AppBar background color to green
  //       iconTheme: IconThemeData(color: Colors.white),
  //     ),
  //     buttonTheme: ButtonThemeData(
  //       buttonColor: Colors.deepOrange,
  //     ),
  //     floatingActionButtonTheme:
  //         FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
  //     drawerTheme: DrawerThemeData(backgroundColor: Colors.white));
}

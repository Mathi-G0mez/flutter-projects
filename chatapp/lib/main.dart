import 'package:flutter/material.dart';
import 'create_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Chat App',
      theme: lightTheme, // Light mode theme
      darkTheme: darkTheme, // Dark mode theme
      themeMode: ThemeMode
          .light, // Toggle between light and dark based on system settings
      debugShowCheckedModeBanner: false,
      home: createAccount(),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF00796B), // Deep tech teal (Primary color)
  scaffoldBackgroundColor: const Color(0xFFF1F1F1), // Light Gray Background
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF00796B), // Primary Tech Green-Blue
    secondary: const Color(0xFFFF7043), // Soft Coral/Orange for Accents
    surface: const Color(0xFFFFFFFF), // Light background
  ),
  textTheme: TextTheme(
    headlineLarge:
        TextStyle(color: Color(0xFF212121), fontSize: 20), // Main header text
    bodyMedium:
        TextStyle(color: Color(0xFF757575), fontSize: 16), // Secondary text
    bodySmall: TextStyle(color: Colors.white), // White text for buttons
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF00796B), // Matching primary color for AppBar
    iconTheme: IconThemeData(color: Colors.white), // White icons
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF7043), // Accent color for FAB
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF00796B), // Deep tech teal (Primary color)
  scaffoldBackgroundColor: const Color(0xFF121212), // Dark Background
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFF00796B), // Primary color
    secondary: const Color(0xFF64FFDA), // Neon Green for Accents
    surface: const Color(0xFF1F1F1F), // Deep black background
  ),
  textTheme: TextTheme(
    headlineLarge:
        TextStyle(color: Colors.white, fontSize: 20), // White text for headers
    bodyMedium:
        TextStyle(color: Color(0xFFB0BEC5), fontSize: 16), // Light gray text
    bodySmall: TextStyle(color: Colors.white), // White text for buttons
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF00796B), // Primary color for dark mode AppBar
    iconTheme: IconThemeData(color: Colors.white), // White icons
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF64FFDA), // Neon green for FAB
  ),
);

import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'pages/stateless_page.dart';
import 'pages/stateful_page.dart';
import 'pages/result_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const primaryColor = Color(0xFFE57373);
  static const accentColor = Color(0xFFF8BBD0);
  static const backgroundColor = Color(0xFFF7EDE9);
  static const textColor = Color(0xFF2E2E2E);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',

      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,

        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: accentColor,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ), // 🔥 hamburger & back putih
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),

        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodyLarge: TextStyle(color: textColor),
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const StatelessPage(),
        '/quiz': (context) => const StatefulPage(),
        '/result': (context) => const ResultPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
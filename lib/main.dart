import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordsplay_demo/landing.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 170, 70, 205),
    background: const Color.fromARGB(255, 170, 70, 205));

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 75, 5, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      title: 'WordPlay',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 24),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const LandingPage(),
    );
  }
}

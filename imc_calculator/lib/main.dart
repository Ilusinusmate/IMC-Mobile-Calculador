import 'package:flutter/material.dart';
import 'package:imc_calculator/data/notifiers.dart';
import 'package:imc_calculator/pages/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkThemeNotifier,
      builder: (context, isDarkTheme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.teal,
            cardColor: const Color.fromARGB(255, 244, 244, 244),
            brightness: Brightness.light,
            primaryTextTheme: TextTheme(
              titleMedium: TextStyle(color: Colors.white),
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            cardColor: const Color.fromARGB(255, 85, 91, 96),
            primaryColor: const Color.fromARGB(255, 33, 62, 59),
            primaryTextTheme: TextTheme(
              titleMedium: TextStyle(color: Colors.white),
            ),
          ),

          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,

          home: HomePage(),
        );
      },
    );
  }
}

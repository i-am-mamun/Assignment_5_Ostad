import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffffbe0b),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xfffff7ff),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffffbe0b),
          foregroundColor: Color(0xff171717),
          elevation: 0,
          centerTitle: false,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

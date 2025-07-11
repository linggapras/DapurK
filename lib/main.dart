import 'package:flutter/material.dart';
import 'widget/splash_screen.dart'; // pastikan ini benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DapurKita',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(), // pastikan nama class-nya cocok
      debugShowCheckedModeBanner: false,
    );
  }
}

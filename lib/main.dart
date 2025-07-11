import 'package:flutter/material.dart';
import 'widget/splash_screen.dart';

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
      home: const SplashScreen(), // Tampilan pertama saat aplikasi dibuka
      debugShowCheckedModeBanner: false, // Menghilangkan label debug
    );
  }
}

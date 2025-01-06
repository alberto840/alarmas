import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calender.io',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Harmattan', // Configura Harmattan como fuente global
        primaryColor: const Color(0xFF735BF2),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), 
        ),
      ),
      home: LoginScreen(),
    );
  }
}

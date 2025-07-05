import 'package:flutter/material.dart';
import 'package:my_wheather_app/weather_screen.dart';

void main() {
  runApp(
    const MyweatherApp());
}
class MyweatherApp extends StatelessWidget {
  const MyweatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
     home:  MainScreen(),
     theme: ThemeData.light(useMaterial3: true),
    );
  }
}

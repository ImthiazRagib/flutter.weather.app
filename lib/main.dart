import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/choose_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/loading': (context) => const LoadingPage(),
        '/home': (context) => const Home(),
        '/chooselocation': (context) => const ChooseLocation(),
      },
    );
  }
}

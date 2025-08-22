import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
// void getWeather() async {
//   try {
//     Response response = await get(
//       Uri.parse('https://jsonplaceholder.typicode.com/todos'),
//     );
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       print("API Response: $data");
//     } else {
//       print("Request failed: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }


  @override
  void initState() {
    super.initState();
    // getWeather();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

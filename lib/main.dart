import 'package:flutter/material.dart';
import 'package:random_advice_app/pages/advice_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Libre'),
      title: 'Random Advice Generator',
      home: const AdvicePage(),
    );
  }
}

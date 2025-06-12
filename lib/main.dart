import 'package:flutter/material.dart';
import 'package:rest_api_practice/examples_rest_api/example1_rest_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Example1RestApi(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:rest_api_practice/examples_rest_api/example4_rest_api.dart';


import 'examples_rest_api/example3_rest_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Example4RestApi()
    );
  }
}


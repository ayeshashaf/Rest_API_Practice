import 'package:flutter/material.dart';
import 'package:rest_api_practice/post_api/login.dart';
import 'package:rest_api_practice/post_api/sign_up.dart';

import 'get_api/exampleFour.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Login()
    );
  }
}


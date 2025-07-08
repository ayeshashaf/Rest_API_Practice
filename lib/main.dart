

import 'package:flutter/material.dart';
import 'package:rest_api_practice/get_api/drop_down_menu.dart';

import 'package:rest_api_practice/post_api/upload_photo.dart';

import 'get_api/exampleFour.dart';


void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: DropDownMenuScreen()
    );
  }
}


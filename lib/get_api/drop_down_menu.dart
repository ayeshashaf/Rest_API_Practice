import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/drop_down_model.dart';

class DropDownMenuScreen extends StatefulWidget {
  const DropDownMenuScreen({super.key});

  @override
  State<DropDownMenuScreen> createState() => _DropDownMenuScreenState();
}

class _DropDownMenuScreenState extends State<DropDownMenuScreen> {
  Future<List<drop_down_model>> getPost() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      final body = json.decode(response.body.toString()) as List;

      if (response.statusCode == 200) {
        return body.map((e) {
          final map = e as Map<String, dynamic>;
          return drop_down_model(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }
    } on SocketException {
      throw Exception('No internet');
    }
    throw Exception('Error fetching data');
  }

  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down Menu Button'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  hint: Text('Select value'),
                  isExpanded: true,
                  icon: Icon(Icons.add),
                  value: selectedValue,
                  items: snapshot.data!.map((e) {
                        return DropdownMenuItem(
                          value: e.title.toString(),
                          child: Text(e.toString()),
                        );
                      }).toList(),
                  onChanged: (value) {
                    selectedValue = value;
                    setState(() {

                    });
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

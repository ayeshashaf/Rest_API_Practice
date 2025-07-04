import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'exampleThree.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  _ExampleFourState createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Rest API'), backgroundColor: Colors.teal,),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shadowColor: Colors.teal,
                        child: Column(
                          children: [
                            ReuseableRow(
                              title: 'name',
                              value: data[index]['name'].toString(),
                            ),
                            ReuseableRow(
                              title: 'Username',
                              value: data[index]['username'].toString(),
                            ),
                            ReuseableRow(
                              title: 'address',
                              value: data[index]['address']['street'].toString(),
                            ),
                            ReuseableRow(
                              title: 'Lat',
                              value: data[index]['address']['geo']['lat'].toString(),
                            ),
                            ReuseableRow(
                              title: 'Lng',
                              value: data[index]['address']['geo']['lng'].toString(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

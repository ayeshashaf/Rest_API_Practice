import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_practice/Model/UserModel.dart';

class Example3RestApi extends StatelessWidget {
  Example3RestApi({super.key});

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rest API'), backgroundColor: Colors.teal),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shadowColor: Colors.teal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ReuseableRow(
                              title: 'Name',
                              value: snapshot.data![index].name.toString(),
                            ),
                            ReuseableRow(
                              title: 'UserName',
                              value: snapshot.data![index].username.toString(),
                            ),
                            ReuseableRow(
                              title: 'Email',
                              value: snapshot.data![index].email.toString(),
                            ),
                            ReuseableRow(
                              title: 'Address',
                              value: snapshot.data![index].address!.city.toString(),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                );
                Card(child: Column(children: []));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;

  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}

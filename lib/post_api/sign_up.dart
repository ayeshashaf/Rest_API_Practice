import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        print('account successfully created');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                login(
                  emailController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String registerURL = "http://127.0.0.1:8000/api/auth/signup";
const String signinURL = "http://127.0.0.1:8000/api/auth/signin";

class AuthClass {
  register(name, email, contact, pass, city) async {
    Map data = {
      "username": email,
      "password": pass,
      "city": city,
      "number": contact,
      "name": name,
    };
    print(data);

    String body = json.encode(data);
    var response = await http.post(
      Uri.parse(registerURL),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      print('success');
    } else {
      print('error');
    }
  }

  login(email, pass, context) async {
    Map data = {
      "username": email,
      "password": pass,
    };
    print(data);

    String body = json.encode(data);
    var response = await http.post(
      Uri.parse(signinURL),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: "Backend Response", content: response.body);
        },
      );
    } else {
      print('error');
    }
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const MyAlertDialog(
      {required this.title, required this.content, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(color: Colors.green, fontSize: 20.0),
      ),
      actions: actions,
      content: Text(
        content,
        style: const TextStyle(color: Colors.green, fontSize: 20.0),
      ),
    );
  }
}

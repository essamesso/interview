import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_work/Screens/home/home_screen.dart';
import '../../constants.dart';
import '../DefaultButton.dart';
import 'package:http/http.dart' as http;
  final _formKey = GlobalKey<FormState>();

class AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: loginemailtexteditcon,
            validator: (value) {
              if (value.isEmpty || value == '') return 'Must Enter Email';
              return null;
            },
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintText: 'EnterE-mail',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(15), child: Icon(Icons.mail)),
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            obscureText: true,
            controller: passwordtexteditcon,
            validator: (value) {
              if (value.isEmpty || value == '') return 'Must Enter Email';
              return null;
            },
            decoration: InputDecoration(
              labelText: "password",
              hintText: "Enterpassword",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(15), child: Icon(Icons.lock)),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.1,),
          DefaultButton(
            text: "login",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // signIn();
                String myurl = "https://helpmeexpress.com/api/login";
                http.post(Uri.parse(myurl), headers: {
                  'Accept': 'application/json',
                }, body: {
                  "email": loginemailtexteditcon.text,
                  "password": passwordtexteditcon.text
                }).then((response) {
                  if (response.statusCode == 200) {
                    var jsonResponse = json.decode(response.body);
                  
                    if (jsonResponse != null) {
                      print(jsonResponse['token']);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen(
                          token: jsonResponse['token'],
                        ),
                      ));
                    }
                  } else {
                    print(
                        "Error message like email or password wrong!!!!"); // Toast
                  }
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

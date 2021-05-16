import 'package:flutter/material.dart';
import 'package:test_work/widgets/authform/AuthForm.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: size.height * .3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AuthForm(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/auth/login_screen.dart';
import 'ViewModels/BloglistViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => BlogListViewModel(),
   child: MaterialApp(
      title: 'interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    ));
  }
}
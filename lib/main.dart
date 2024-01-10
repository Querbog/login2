import 'package:flutter/material.dart';
import 'package:login2/WelcomeScreen.dart';
import 'package:login2/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: LoginScreen(),
    );
  }
}

//colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//useMaterial3: true,

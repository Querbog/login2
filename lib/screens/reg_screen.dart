import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login2/screens/home_screen.dart';
import 'package:login2/utilities/input_text_field.dart';
import 'package:login2/utilities/button.dart';
import 'package:get/get.dart';

class RegScreen extends StatefulWidget {
  RegScreen({Key? key}) : super(key: key);

  @override
  _RegScreenState createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();

  bool isLoading = false;

  Future<void> createUser() async {
    setState(() {
      isLoading = true;
    });

    String email = emailEditingController.text.trim();
    String password = passwordEditingController.text.trim();

    try {
      if (email.isEmpty || password.isEmpty) {
        throw 'Please fill all the required details...';
      }

      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Use verifyPhoneNumber for phone number authentication
      // Example: await FirebaseAuth.instance.verifyPhoneNumber(...)

      log('User created: ${userCredential.user?.uid}');
      Get.to(() => HomeScreen());

      // Provide feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User created successfully!'),
        ),
      );
    } catch (e) {
      log('Error creating user: $e');

      // Provide error feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating user: $e'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  'Welcome to our app',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 30.0),
                        InputTextField(
                          label: 'Gmail',
                          icon: Icons.mail,
                          controller: emailEditingController,
                          obscure: false,
                        ),
                        const SizedBox(height: 20.0),
                        InputTextField(
                          label: 'Mobile number',
                          icon: Icons.phone,
                          controller: numberEditingController,
                          obscure: false,
                        ),
                        const SizedBox(height: 20.0),
                        InputTextField(
                          label: 'Password',
                          icon: Icons.key,
                          controller: passwordEditingController,
                          obscure: true,
                        ),
                        const SizedBox(height: 16),
                        Button(
                          title: isLoading ? 'Signing in...' : 'Sign Up',
                          colour: Colors.black54,
                          onPressed: isLoading ? null : createUser,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

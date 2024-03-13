import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/screens/forgot_password_screen.dart';
import 'package:login2/screens/home_screen.dart';
import 'package:login2/screens/reg_screen.dart';
import 'package:login2/utilities/button.dart';
import 'package:login2/utilities/input_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  void loggedInUser() async {
    setState(() {
      isLoading = true;
    });

    String email = emailEditingController.text.trim();
    String password = passwordEditingController.text.trim();

    try {
      if (email.isEmpty || password.isEmpty) {
        throw 'Please fill all the required details...';
      }
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        log('User Logeed-In: ${userCredential.user?.uid}');
        Get.to(() => const HomeScreen());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User Logged-in successfully!'),
          ),
        );
    } catch (e) {
      log('Error logging-in user: $e');

      // Provide error feedback to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging-in user: $e'),
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
                child: const Text(
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
                        topRight: Radius.circular(40.0))),
                //height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        InputTextField(
                          label: 'Gmail',
                          icon: Icons.mail,
                          controller: emailEditingController,
                          obscure: false,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputTextField(
                          label: 'password',
                          icon: Icons.key,
                          controller: passwordEditingController,
                          obscure: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> const ForgotPasswordScreen());
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Button(
                            title: 'Login',
                            colour: Colors.black54,
                            onPressed: () {
                              loggedInUser();
                            }),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const RegScreen());
                              },
                              child: const Text(
                                'Sign up!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        )
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

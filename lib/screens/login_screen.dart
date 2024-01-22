import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login2/screens/reg_screen.dart';
import 'package:login2/utilities/button.dart';
import 'package:login2/utilities/input_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();

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
                  style: TextStyle(
                    fontSize: 20.0
                  ),
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
                        InputTextField(label: 'Gmail', icon: Icons.mail,controller: emailEditingController,obscure: false,),
                        const SizedBox(
                          height: 20.0,
                        ),
                        InputTextField(
                            label: 'password', icon: Icons.visibility_off,controller: passwordEditingController,obscure: false,),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Button(title: 'Login', colour: Colors.black54, onPressed: (){}),
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
                                Get.to(()=> RegScreen());
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

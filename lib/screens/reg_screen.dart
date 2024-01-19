import 'package:flutter/material.dart';
import 'package:login2/screens/home_screen.dart';
import 'package:login2/utilities/input_text_field.dart';
import 'package:login2/utilities/button.dart';
import 'package:get/get.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

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
                        const InputTextField(label: 'Gmail', icon: Icons.mail),
                        const SizedBox(height: 20.0,),
                        const InputTextField(label: 'Mobile number', icon: Icons.phone),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const InputTextField(
                            label: 'password', icon: Icons.visibility_off),
                        const SizedBox(
                          height: 16,
                        ),
                        Button(title: 'Sign-in', colour: Colors.black54, onPressed: (){
                          Get.to( ()=> HomeScreen());
                        }),
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

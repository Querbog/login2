import 'package:flutter/material.dart';
import 'package:login2/login_screen.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25.0,
                      ),
                      const NewWidget(label: 'Phone number', icon: Icons.phone),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const NewWidget(label: 'gmail', icon: Icons.mail),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const NewWidget(
                          label: 'password', icon: Icons.visibility_off),
                      const SizedBox(
                        height: 28.0,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: const Text("Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //)
          ],
        ),
      ),
    );
  }
}

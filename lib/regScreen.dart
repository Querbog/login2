import 'package:flutter/material.dart';
import 'package:login2/loginScreen.dart';

class regScreen extends StatelessWidget {
  const regScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     alignment: Alignment.topLeft,
            //     // decoration: BoxDecoration(
            //     //   gradient: LinearGradient(
            //     //     colors: [
            //     //       Color(0xffB8736),
            //     //       Color(0xffB1836),
            //     //     ],
            //     //   ),
            //     // ),
            //     // child: Text(
            //     //   'Please Sign In!',
            //     //   style: TextStyle(
            //     //       fontSize: 30,
            //     //       color: Colors.white,
            //     //       fontWeight: FontWeight.bold),
            //     // ),
            //   ),
            // ),
            Container(
              // duration: Duration(milliseconds: 700),
              // curve: Curves.bounceInOut,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.0,
                      ),

                      NewWidget(label: 'Phone number', icon: Icons.phone),

                      SizedBox(
                        height: 20.0,
                      ),

                      NewWidget(label: 'gmail', icon: Icons.mail),

                      SizedBox(
                        height: 20.0,
                      ),
                      NewWidget(label: 'password', icon: Icons.visibility_off),
                      //
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: Text(
                      //     'Forgot Password?',
                      //     style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.black,
                      //       fontSize: 17,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 28.0,
                      ),
                      // Container(
                      //   height: 55,
                      //   width: 300,
                      //   // decoration: BoxDecoration(
                      //   //   gradient: LinearGradient(
                      //   //     colors: [
                      //   //       Color(0xffB8736),
                      //   //       Color(0xffB1836),
                      //   //     ],
                      //   //   ),
                      //   // ),
                      //   child: Center(
                      //
                      //       child: Text(
                      //     'Log In',
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20,
                      //         color: Colors.white,
                      //
                      //     ),
                      //   )),
                      // ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: Text("Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            )),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         "Don't have an Account?",
                      //         style: TextStyle(
                      //             color: Colors.grey,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => regScreen()));
                      //         },
                      //         child: Text(
                      //           'Sign up!',
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 17,
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
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

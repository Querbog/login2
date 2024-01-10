import 'package:flutter/material.dart';
import 'package:login2/regScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                // duration: Duration(milliseconds: 200),
                // curve: Curves.bounceOut,
                alignment: Alignment.topLeft,
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Color(0xffB8736),
                //       Color(0xffB1836),
                //     ],
                //   ),
                // ),
                // child: Text(
                //   'Please Sign In!',
                //   style: TextStyle(
                //       fontSize: 30,
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold),
                // ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                // duration: Duration(seconds: 3),
                // curve: Curves.slowMiddle,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0))),
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        NewWidget(label: 'Gmail', icon: Icons.mail),
                        SizedBox(
                          height: 20.0,
                        ),
                        NewWidget(
                            label: 'password', icon: Icons.visibility_off),
                        SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ),
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
                          onPressed: () {
                            //add navigation after login screen
                          },
                          child: Text("Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Don\'t have an Account?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => regScreen()));
                                },
                                // Padding(
                                //   padding: EdgeInsets.symmetric(vertical: 16.0),
                                //   child: Material(
                                //     color: Colors.blueAccent,
                                //     borderRadius: BorderRadius.circular(30.0),
                                //     child: MaterialButton(
                                //       onPressed: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //             builder: (context) => regScreen(),
                                //           ),
                                //         );
                                //       },
                                child: Text(
                                  'Sign up!',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                //     ),
                                //   ),
                                //)
                                //)
                              )
                            ],
                          ),
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

//   TextField buildTextField(String label) {
//     return TextField(
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(35))),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Colors.grey,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(35))),
//         suffixIcon: Icon(
//           Icons.visibility_off,
//           color: Colors.grey,
//         ),
//         label: Text(
//           label,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Color(0xffB81736),
//           ),
//         ),
//       ),
//       obscureText: true,
//     );
//   }
// }

class NewWidget extends StatelessWidget {
  NewWidget({
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            suffixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            label: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xffB81736),
              ),
            )));
  }
}
// we have to make this page more pleasing.
//we can pull sign up navigator on pag more downwards.

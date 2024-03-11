import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login2/utilities/input_text_field.dart';
import 'package:login2/utilities/button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailEditingController = TextEditingController();

  Future passwordReset()async{
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailEditingController.text.trim());
  }on FirebaseAuthException catch (e){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$e'),
      ),
    );
  }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter your Email and we will send you a password reset link',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20
            ),),
            SizedBox(height: 15.0,),
            InputTextField(
              label: 'Gmail',
              icon: Icons.mail,
              controller: emailEditingController,
              obscure: false,
            ),
            SizedBox(height: 15.0,),
            Button(
                title: 'Reset Password',
                colour: Colors.lightBlueAccent,
                onPressed: passwordReset
            ),
          ],
        ),
      ),
    );
  }
}

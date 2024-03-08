import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({

    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.obscure,
    this.onChanged,
  });
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscure;
  final Function(String)? onChanged;

  void onPasswordChange(String password) {
    // Implement your password validation logic here
    if (password.length >= 8 && containsSpecialCharacter(password)) {
      // Password is valid
      print('Password is valid');
    } else {
      // Password is not valid
      print('Password is not valid');
    }
  }
  bool containsSpecialCharacter(String value) {
    // Define your special characters or use a regex pattern
    String specialCharacters = r'!@#$%^&*()_-+={}[]|\:;"<>,.?/~`';
    return value.split('').any((char) => specialCharacters.contains(char));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (text) {
        onPasswordChange(controller.text); // Pass the current text from the controller
        if (onChanged != null) {
          onChanged!(text);
        }
      },
      obscureText: obscure,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        suffixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

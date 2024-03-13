import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({

    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.obscure,
    // this.onChanged,
  });
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscure;
  // final Function(String)? onChanged;



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      // onChanged: (text) {
      //   onPasswordChange(controller.text); // Pass the current text from the controller
      //   if (onChanged != null) {
      //     onChanged!(text);
      //   }
      // },
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

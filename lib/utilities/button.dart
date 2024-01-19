import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.title ,required this.colour,required this.onPressed});

  final String title;
  final Color colour;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: double.infinity,
          height: 40.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
            ),
          ),
        ),
      ),
    );
  }
}
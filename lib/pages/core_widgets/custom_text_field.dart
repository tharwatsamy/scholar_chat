import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: kBackgroundColo,
        ),
        hintText: 'Enter your password',
        hintStyle: TextStyle(color: kBackgroundColo),
        border: OutlineInputBorder(),
      ),
    );
  }
}

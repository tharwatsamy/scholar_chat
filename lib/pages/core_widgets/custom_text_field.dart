import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/enums/text_input_type.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final InputType textInputType;
  final String hintText;
  final String labelText;
  final Function onPressed;
  final Function validator;
  CustomTextField(
      {@required this.icon,
      @required this.textInputType,
      this.hintText,
      this.labelText,
      @required this.onPressed,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onPressed,
      keyboardType: getKeyboardInputType(textInputType),
      style: TextStyle(color: Colors.white),
      obscureText: textInputType == InputType.password ? true : false,
      decoration: InputDecoration(
//        filled: true,
//        fillColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        suffixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        hintText: hintText,

        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  getKeyboardInputType(InputType textInputType) {
    switch (textInputType) {
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.password:
        return TextInputType.text;
      case InputType.name:
        return TextInputType.name;
    }
  }
}

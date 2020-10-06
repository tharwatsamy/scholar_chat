import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/sign_up_page/sign_up_screen.dart';

class SignUpRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "don't have an account ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpScreen.id);
          },
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 15, color: kLogoColor),
          ),
        )
      ],
    );
  }
}

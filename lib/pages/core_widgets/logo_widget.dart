import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('images/scholar.png'),
        ),
        Text(
          'Scholar Chat',
          style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}

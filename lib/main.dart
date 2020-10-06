import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/pages/sign_up_page/sign_up_screen.dart';
import 'package:scholar_chat/pages/signin_page/signin_screen.dart';

main() {
  runApp(ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        SigninScreen.id: (context) => SigninScreen(),
      },
      initialRoute: SigninScreen.id,
    );
  }
}

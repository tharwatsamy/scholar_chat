import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/signin_page/components/signup_row.dart';

import '../core_widgets/logo_widget.dart';
import 'components/text_field_column.dart';

class SigninScreen extends StatefulWidget {
  static String id = 'SignIn_Screen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _password;
  bool inProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColo,
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LogoWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldColumn(),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        inProgress = true;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            color: kBackgroundColo,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SignUpRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/Provicers/auth_service.dart';
import 'package:scholar_chat/Provicers/user_data_provider.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/chat_screen.dart';
import 'package:scholar_chat/pages/core_widgets/logo_widget.dart';
import 'package:scholar_chat/pages/sign_up_page/components/sign_up_text_field_column.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColo,
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                autovalidateMode: _autovalidateMode,
                key: _formKey,
                child: Column(
                  children: [
                    LogoWidget(),
                    SizedBox(height: MediaQuery.of(context).size.height * .15),
                    Container(
                      width: double.infinity,
                      child: Text(
                        'Sign Up',
                        style: kSignUpStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SignUPTextFieldColumn(
                      emailValidator: (String value) {
                        if (value.isEmpty) {
                          return 'value is empty';
                        } else {
                          if (!validateEmailAddress(value)) {
                            return 'wrong email';
                          }
                        }
                      },
                      emailGetter: (value) {
                        _email = value;
                      },
                      passwrodGetter: (value) {
                        _password = value;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            inProgress = true;
                          });
                          UserCredential user = await Provider.of<AuthService>(
                                  context,
                                  listen: false)
                              .signUp(email: _email, password: _password);
                          Provider.of<UserProvider>(context, listen: false).s =
                              user;
                          Navigator.pushNamed(context, ChatScreen.id);
                          setState(() {
                            inProgress = false;
                          });
                        } else {
                          _autovalidateMode =
                              AutovalidateMode.onUserInteraction;
                        }
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: kBackgroundColo,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmailAddress(String email) {
    if (email == null) {
      return false;
    }

    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}

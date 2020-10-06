import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/core_widgets/logo_widget.dart';
import 'package:scholar_chat/pages/sign_up_page/components/sign_up_text_field_column.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColo,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                LogoWidget(),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Sign Up',
                    style: kSignUpStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SignUPTextFieldColumn(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: 120,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

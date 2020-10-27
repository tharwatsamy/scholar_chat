import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat/enums/text_input_type.dart';
import 'package:scholar_chat/pages/core_widgets/custom_text_field.dart';

class SignUPTextFieldColumn extends StatelessWidget {
  final Function emailGetter;
  final Function passwrodGetter;
  final Function nameValidator;
  final Function passwordValidator;
  final Function emailValidator;
  SignUPTextFieldColumn(
      {@required this.emailGetter,
      @required this.passwrodGetter,
      @required this.nameValidator,
      @required this.passwordValidator,
      @required this.emailValidator});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          validator: nameValidator,
          labelText: 'Name',
          hintText: 'Enter your Name',
          textInputType: InputType.name,
          icon: Icons.person,
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(
          validator: emailValidator,
          onPressed: emailGetter,
          labelText: 'Email',
          hintText: 'Enter you Email',
          textInputType: InputType.email,
          icon: Icons.email,
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextField(
          validator: passwordValidator,
          onPressed: passwrodGetter,
          labelText: 'Password',
          hintText: 'Enter your password',
          textInputType: InputType.password,
          icon: Icons.remove_red_eye,
        ),
      ],
    );
  }
}

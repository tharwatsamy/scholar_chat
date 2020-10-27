import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/enums/text_input_type.dart';
import 'package:scholar_chat/pages/core_widgets/custom_text_field.dart';

class TextFieldColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          textInputType: InputType.email,
          icon: Icons.email,
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          labelText: 'password',
          hintText: 'Enter your password',
          textInputType: InputType.password,
          icon: Icons.remove_red_eye,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/pages/core_widgets/custom_text_field.dart';

class TextFieldColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(),
        SizedBox(
          height: 10,
        ),
        CustomTextField(),
      ],
    );
  }
}

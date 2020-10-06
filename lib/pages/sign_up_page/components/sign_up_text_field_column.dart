import 'package:flutter/cupertino.dart';
import 'package:scholar_chat/pages/core_widgets/custom_text_field.dart';

class SignUPTextFieldColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(),
        SizedBox(
          height: 8,
        ),
        CustomTextField(),
        SizedBox(
          height: 8,
        ),
        CustomTextField(),
      ],
    );
  }
}

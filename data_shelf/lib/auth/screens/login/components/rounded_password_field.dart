import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: primaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: primaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}

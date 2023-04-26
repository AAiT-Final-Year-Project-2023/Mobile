import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedTextField({
    super.key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: primaryColor,
              ),
              hintText: hintText,
              border: InputBorder.none,
            )));
  }
}
